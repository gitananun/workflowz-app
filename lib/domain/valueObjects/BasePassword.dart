import 'package:flutter/foundation.dart';
import 'contracts/ValueObjectInterface.dart';

@immutable
class BasePassword implements ValueObjectInterface {
  factory BasePassword(String input) => BasePassword._(validate(input));
  const BasePassword._(this.value);
  final String value;

  @override
  String getValue() => value;

  @override
  List<Object?> get props => [value];

  @override
  bool? get stringify => false;
}

String validate(String input) => input.isEmpty || input.isNotEmpty ? input : throw InvalidPasswordException(input);

class InvalidPasswordException implements Exception {
  InvalidPasswordException(this.value);
  final String value;
}
