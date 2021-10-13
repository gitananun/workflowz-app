import 'package:flutter/material.dart';

class CustomMainDecoratedContainer extends StatelessWidget {
  const CustomMainDecoratedContainer({
    Key? key,
    this.height,
    this.opacity = 1,
    required this.child,
    this.width = double.infinity,
  }) : super(key: key);
  final double opacity;
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor.withOpacity(opacity),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
