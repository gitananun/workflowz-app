import '../../../../domain/valueObjects/BaseEmail.dart';
import '../../../../domain/valueObjects/BasePassword.dart';
import '../../form_submission_status.dart';

class SignupState {
  final BaseEmail email;
  final BasePassword password;
  final BasePassword confirmPassword;
  final FormSubmissionStatus formStatus;

  SignupState({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.formStatus,
  });

  SignupState copyWith({
    BaseEmail? email,
    BasePassword? password,
    BasePassword? confirmPassword,
    FormSubmissionStatus? formStatus,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

class SignupInitial extends SignupState {
  SignupInitial()
      : super(
          email: BaseEmail(''),
          password: BasePassword(''),
          confirmPassword: BasePassword(''),
          formStatus: InitialFormStatus(),
        );
}
