import 'package:flutter/material.dart';

import '../../../Styles/custom_text_form_field_style.dart';

class CustomSuffixButtonRowDividerWithText extends StatelessWidget {
  const CustomSuffixButtonRowDividerWithText({Key? key, required this.text, this.onTap}) : super(key: key);
  final String text;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            VerticalDivider(color: _themeData.primaryColor, thickness: 1),
            SizedBox(width: 5),
            Text(text, style: CustomTextFormFieldStyle.mainTextStyle(context)),
          ],
        ),
      ),
    );
  }
}
