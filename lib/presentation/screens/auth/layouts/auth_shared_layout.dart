import 'package:flutter/material.dart';

class SharedAuthLayout extends StatelessWidget {
  const SharedAuthLayout({Key? key, required this.section1, required this.section2}) : super(key: key);
  final Widget section1;
  final Widget section2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: section1,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: section2,
            ),
          ),
        ),
      ],
    );
  }
}
