import 'package:flutter/material.dart';

class CustomCircleButtonWithBorder extends StatelessWidget {
  const CustomCircleButtonWithBorder({
    Key? key,
    this.iconSize,
    required this.icon,
    required this.color,
    this.paddingValue = 10,
    required this.onPressed,
  }) : super(key: key);
  final Color color;
  final IconData icon;
  final double? iconSize;
  final double paddingValue;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 0,
      textColor: color,
      onPressed: onPressed,
      padding: EdgeInsets.all(paddingValue),
      shape: CircleBorder(side: BorderSide(color: color)),
      child: Icon(icon, size: iconSize),
    );
  }
}
