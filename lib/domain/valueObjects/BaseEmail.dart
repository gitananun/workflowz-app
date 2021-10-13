import 'package:flutter/foundation.dart';
import '../../infrastructure/validations/validators/EmailValidator.dart';
import 'contracts/ValueObjectInterface.dart';

@immutable
class BaseEmail implements ValueObjectInterface {
  factory BaseEmail(String input) => BaseEmail._(validate(input));

  const BaseEmail._(this.value);

  final String value;

  @override
  String getValue() => value.toLowerCase();

  @override
  List<Object?> get props => [value];

  @override
  bool? get stringify => false;
}

String validate(String input) {
  final EmailValidator _emailValidator = EmailValidator(input);

  return input.isEmpty || _emailValidator.regexHasMatch ? input : throw InvalidEmailException(input);
}

class InvalidEmailException implements Exception {
  InvalidEmailException(this.value);
  final String value;
}
