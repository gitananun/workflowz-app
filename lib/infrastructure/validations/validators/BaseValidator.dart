import 'package:flutter/material.dart';

import '../../../constants/enums.dart';
import '../AbstractValidator.dart';
import '../ValidationMessages.dart';

@immutable
class BaseValidator extends AbstractValidator {
  BaseValidator(this.text);
  final String text;

  final ValidationType type = ValidationType.Base;

  @override
  String? get validate {
    if (!regexHasMatch) {
      return ValidationMessages.get(type);
    }
  }

  @override
  bool get regexHasMatch => text.isNotEmpty;
}
