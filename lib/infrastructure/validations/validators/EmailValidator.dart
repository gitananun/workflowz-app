import 'package:flutter/material.dart';

import '../../../constants/enums.dart';
import '../AbstractValidator.dart';
import '../ValidationMessages.dart';
import '../ValidationRegexes.dart';

@immutable
class EmailValidator extends AbstractValidator {
  EmailValidator(this.text);
  final String text;

  final ValidationType type = ValidationType.Email;

  @override
  String? get validate {
    if (!regexHasMatch) {
      return ValidationMessages.get(type);
    }
  }

  @override
  bool get regexHasMatch => RegExp(ValidationRegexes.get(type)).hasMatch(text);
}
