import 'package:flutter/material.dart';

import '../../constants/enums.dart';
import '../Exceptions/RegexNotFoundException.dart';

@immutable
class ValidationRegexes {
  static final Map<ValidationType, String> _expressions = {
    ValidationType.Email: r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  };

  static String get(ValidationType type) {
    if (_expressions.isEmpty || !_expressions.containsKey(type)) {
      throw RegexNotFoundException(type);
    }
    return _expressions[type]!;
  }
}
