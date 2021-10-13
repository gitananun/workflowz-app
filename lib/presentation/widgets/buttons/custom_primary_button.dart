import 'package:flutter/material.dart';

import '../../styles/button_colors.dart';
import 'custom_button_text.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    Key? key,
    required this.text,
    this.withBackground = false,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final bool withBackground;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: withBackground ? ButtonColors.primaryLinearGradient : null,
          borderRadius: BorderRadius.circular(100),
          border: !withBackground ? Border.all(color: ButtonColors.primaryBorderColor) : null,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: TextButton(
            onPressed: onPressed,
            child: CustomButtonText(text),
          ),
        ),
      ),
    );
  }
}
