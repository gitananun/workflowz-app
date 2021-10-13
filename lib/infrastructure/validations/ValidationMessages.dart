import 'package:flutter/material.dart';

import '../../constants/enums.dart';
import '../Exceptions/ValidationMessageNotFoundException.dart';

@immutable
class ValidationMessages {
  static final Map<ValidationType, String> _messages = {
    ValidationType.Base: "Field can't be empty!",
    ValidationType.Email: 'Email is not valid!',
    ValidationType.Password: 'Password is not valid!',
  };

  static String get(ValidationType type) {
    if (_messages.isEmpty || !_messages.containsKey(type)) {
      throw ValidationMessageNotFoundException(type);
    }
    return _messages[type]!;
  }
}
