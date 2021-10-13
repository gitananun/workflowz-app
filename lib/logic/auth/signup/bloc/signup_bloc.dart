import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../session/bloc/session_cubit.dart';

import '../../api_auth_repository.dart';
import '../../form_submission_status.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final ApiAuthRepository authRepo;
  final SessionCubit sessionCubit;

  SignupBloc({
    required this.authRepo,
    required this.sessionCubit,
  }) : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    /// Form submitted
    if (event is SignupSubmitted) {
      yield state.copyWith(
        email: event.email,
        password: event.password,
        confirmPassword: event.confirmPassword,
        formStatus: FormSubmitting(),
      );

      try {
        final user = await authRepo.signup(
          email: state.email,
          password: state.password,
          confirmPassword: state.confirmPassword,
        );

        yield state.copyWith(formStatus: SubmissionSuccess());
        sessionCubit.authenticate(user);
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
