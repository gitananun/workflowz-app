import 'package:flutter/material.dart';

import 'custom_primary_button.dart';

class CustomSmallCenteredPrimaryButton extends StatelessWidget {
  const CustomSmallCenteredPrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.withBackground = false,
  }) : super(key: key);
  final String text;
  final bool withBackground;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SizedBox()),
        Expanded(child: CustomPrimaryButton(text: text, withBackground: withBackground, onPressed: onPressed)),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
