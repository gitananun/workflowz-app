import 'package:flutter/material.dart';

class WelcomeLayout extends StatelessWidget {
  const WelcomeLayout({Key? key, required this.section1, required this.section2}) : super(key: key);
  final Widget section1;
  final Widget section2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: section1),
        Expanded(child: section2),
      ],
    );
  }
}
