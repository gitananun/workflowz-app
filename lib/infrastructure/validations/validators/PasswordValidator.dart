import 'package:flutter/material.dart';

import '../../../constants/enums.dart';
import '../AbstractValidator.dart';
import '../ValidationMessages.dart';

@immutable
class PasswordValidator extends AbstractValidator {
  PasswordValidator(this.text);
  final String text;

  final ValidationType type = ValidationType.Password;

  @override
  String? get validate {
    if (text.isEmpty) {
      return ValidationMessages.get(type);
    }
  }

  @override
  bool get regexHasMatch => true;
}
