import '../../../../domain/valueObjects/BaseEmail.dart';
import '../../../../domain/valueObjects/BasePassword.dart';
import '../../form_submission_status.dart';

class LoginState {
  final BaseEmail email;
  final BasePassword password;
  final FormSubmissionStatus formStatus;

  LoginState({
    required this.email,
    required this.password,
    required this.formStatus,
  });

  LoginState copyWith({
    BaseEmail? email,
    BasePassword? password,
    FormSubmissionStatus? formStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class LoginInitial extends LoginState {
  LoginInitial()
      : super(
          email: BaseEmail(''),
          password: BasePassword(''),
          formStatus: const InitialFormStatus(),
        );
}
