import 'package:flutter/material.dart';

class CustomTextWithUnderline extends StatelessWidget {
  const CustomTextWithUnderline(
    this.text, {
    Key? key,
    this.textStyle,
    this.textColor,
  }) : super(key: key);
  final String text;
  final Color? textColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Text(
      text,
      style: textStyle?.copyWith(
        decorationThickness: 1,
        color: Colors.transparent,
        decorationColor: Colors.white,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.solid,
        shadows: [Shadow(color: textColor ?? _themeData.accentColor, offset: Offset(0, -8))],
      ),
    );
  }
}
