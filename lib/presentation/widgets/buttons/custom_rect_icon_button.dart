import 'package:flutter/material.dart';

class CustomRectIconButton extends StatelessWidget {
  const CustomRectIconButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return SizedBox(
      width: 50,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_themeData.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
