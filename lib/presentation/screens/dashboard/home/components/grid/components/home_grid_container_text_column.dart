import 'package:flutter/material.dart';

import '../../../../../../widgets/texts/custom_text_with_underline.dart';

class HomeGridContainerTextColumn extends StatelessWidget {
  const HomeGridContainerTextColumn({
    Key? key,
    required this.firstText,
    required this.secondText,
    this.withUnderline = true,
  }) : super(key: key);
  final bool withUnderline;
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextStyle? _textStyle = _themeData.textTheme.caption?.apply(fontSizeDelta: -2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (withUnderline)
          CustomTextWithUnderline(firstText, textStyle: _textStyle)
        else
          Text(firstText, style: _textStyle),
        SizedBox(height: 5),
        Text(
          secondText,
          style: _textStyle?.copyWith(color: _themeData.primaryColor),
        ),
      ],
    );
  }
}
