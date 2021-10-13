import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/valueObjects/BaseEmail.dart';
import '../../domain/valueObjects/BasePassword.dart';
import '../../logic/auth/api_user_repository.dart';
import '../../logic/auth/login/bloc/login_bloc.dart';
import '../../logic/auth/login/bloc/login_event.dart';
import '../../logic/session/bloc/session_cubit.dart';

class AuthActions {
  ///
  void login({
    required LoginBloc bloc,
    required String email,
    required String password,
  }) {
    bloc.add(
      LoginSubmitted(
        email: BaseEmail(email),
        password: BasePassword(password),
      ),
    );
  }

  ///
  Future<void> attemptAutoLogin(SessionCubit cubit, ApiUserRepository userRepository) async {
    final storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    if (token != null) {
      final user = await userRepository.self(token);
      cubit.authenticate(user);
    }
  }

  ///
  Future<void> logOut(SessionCubit cubit) async {
    cubit.unauthenticate();
    final storage = FlutterSecureStorage();
    await storage.delete(key: 'token');
  }
}
