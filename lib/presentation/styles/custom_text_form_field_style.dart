import 'package:flutter/material.dart';

abstract class CustomTextFormFieldStyle {
  static TextStyle mainTextStyle(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return _textTheme.overline!.apply(color: _textTheme.headline1?.color);
  }

  static InputDecoration inputDecoration(BuildContext context) => InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), gapPadding: 5),
        labelStyle: mainTextStyle(context),
        contentPadding: EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(5),
        ),
      );
}
