import 'package:flutter/material.dart';

class CustomFancyFabToggle extends StatelessWidget {
  const CustomFancyFabToggle({
    Key? key,
    required this.icon,
    required this.progress,
    required this.onPressed,
    required this.backgroundColor,
  }) : super(key: key);
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final Animation<double> progress;
  final AnimatedIconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: backgroundColor,
      onPressed: onPressed,
      child: AnimatedIcon(
        color: Colors.white,
        progress: progress,
        icon: icon,
      ),
    );
  }
}
