import 'package:flutter/material.dart';

class CustomButtonText extends StatelessWidget {
  const CustomButtonText(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.caption?.apply(color: Colors.white),
    );
  }
}
