import '../../../../domain/valueObjects/BaseEmail.dart';
import '../../../../domain/valueObjects/BasePassword.dart';

abstract class SignupEvent {}

class SignupSubmitted extends SignupEvent {
  final BaseEmail email;
  final BasePassword password;
  final BasePassword confirmPassword;

  SignupSubmitted({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
