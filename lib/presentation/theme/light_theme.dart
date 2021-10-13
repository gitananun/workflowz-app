import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:workflowz/presentation/theme/mts_theme.dart';

class LightTheme extends MTStheme {
  @override
  Color get accentColor => Colors.black;

  @override
  Color get canvasColor => Color(0xFFF9F9F9);

  @override
  Color get cardBgColor => Colors.white;

  @override
  Color get dividerColor => Colors.grey;

  @override
  Color get errorColor => Colors.grey;

  @override
  Color get hintColor => Colors.grey;

  @override
  Color get primaryColor => Color(0xFFFA8E4B);

  @override
  Color get primaryTextColor => Colors.black;

  @override
  Color get secondaryTextColor => Colors.grey;

  @override
  Color get splashColor => Colors.transparent;

  @override
  Color get successColor => Color(0xFF02C338);
}
