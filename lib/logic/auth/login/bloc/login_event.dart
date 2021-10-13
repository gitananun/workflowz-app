import '../../../../domain/valueObjects/BaseEmail.dart';
import '../../../../domain/valueObjects/BasePassword.dart';

abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final BaseEmail email;
  final BasePassword password;

  LoginSubmitted({required this.email, required this.password});
}
