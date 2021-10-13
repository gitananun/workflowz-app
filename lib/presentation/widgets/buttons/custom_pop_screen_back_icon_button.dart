import 'package:flutter/material.dart';

class CustomPopScreenBackIconButton extends StatelessWidget {
  const CustomPopScreenBackIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return IconButton(
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      onPressed: () => Navigator.maybePop(context),
      icon: Icon(Icons.arrow_back, color: _themeData.accentColor, size: 28),
    );
  }
}
