import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:workflowz/presentation/theme/mts_theme.dart';

class DarkTheme extends MTStheme {
  @override
  Color get accentColor => Color(0xFFd0dbea);

  @override
  Color get canvasColor => Color(0xFF151515);

  @override
  Color get cardBgColor => Color(0xFF222222);

  @override
  Color get dividerColor => Color(0xFFd0dbea);

  @override
  Color get errorColor => Colors.white70;

  @override
  Color get hintColor => Colors.white;

  @override
  Color get primaryColor => Color(0xFFFA8E4B);

  @override
  Color get primaryTextColor => Colors.white;

  @override
  Color get secondaryTextColor => Colors.white;

  @override
  Color get splashColor => Colors.transparent;

  @override
  Color get successColor => Color(0xFF02C338);
}
