import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../domain/data/models/AuthCredentials.dart';
import '../../../../domain/data/models/User.dart';

import '../../../session/bloc/session_cubit.dart';
import '../../api_auth_repository.dart';
import '../../api_user_repository.dart';
import '../../form_submission_status.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SessionCubit sessionCubit;
  final ApiAuthRepository authRepo;
  final ApiUserRepository userRepo;
  final FlutterSecureStorage storage;

  LoginBloc({
    required this.authRepo,
    required this.userRepo,
    required this.sessionCubit,
    required this.storage,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginSubmitted) {
      yield state.copyWith(
        email: event.email,
        password: event.password,
        formStatus: FormSubmitting(),
      );

      try {
        final AuthCredentials credentials = await authRepo.login(email: state.email, password: state.password);
        final User user = await userRepo.self(credentials.token);

        yield state.copyWith(formStatus: SubmissionSuccess());
        sessionCubit.authenticate(user);

        await storage.write(key: 'token', value: credentials.token);
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
