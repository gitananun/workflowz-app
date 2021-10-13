import 'package:flutter/material.dart';

class CustomRadiantGradientMask extends StatelessWidget {
  const CustomRadiantGradientMask({
    Key? key,
    required this.child,
    this.colors = const [Colors.orange, Colors.white],
  }) : super(key: key);
  final List<Color> colors;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        radius: 1.5,
        colors: colors,
        center: Alignment.topRight,
      ).createShader(bounds),
      child: Container(width: double.infinity, height: 30, child: child),
    );
  }
}
