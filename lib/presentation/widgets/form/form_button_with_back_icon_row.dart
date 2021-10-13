import 'package:flutter/material.dart';
import '../buttons/custom_arrow_back_icon_gesture_detector.dart';
import '../buttons/custom_primary_button.dart';

class FormButtonWithBackIconRow extends StatelessWidget {
  const FormButtonWithBackIconRow({
    Key? key,
    this.onBack,
    this.onPressed,
    required this.buttonText,
  }) : super(key: key);
  final String buttonText;
  final VoidCallback? onPressed;
  final GestureTapCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomArrowBackIconGestureDetector(onTap: onBack ?? () => Navigator.maybePop(context))),
        Expanded(
          flex: 2,
          child: CustomPrimaryButton(
            text: buttonText,
            withBackground: true,
            onPressed: onPressed,
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
