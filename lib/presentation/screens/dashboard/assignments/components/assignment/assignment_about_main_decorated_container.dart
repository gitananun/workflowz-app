import 'package:flutter/material.dart';

import '../../../../../widgets/containers/custom_main_decorated_container.dart';

class AssignmentAboutMainDecoratedContainer extends StatelessWidget {
  const AssignmentAboutMainDecoratedContainer({
    Key? key,
    this.title,
    this.body = '',
    this.additional,
    this.subtitle = '',
  }) : super(key: key);

  final String body;
  final String? title;
  final String subtitle;
  final Widget? additional;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextStyle? _textStyle = _themeData.textTheme.caption;

    return CustomMainDecoratedContainer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (title != null) Text(title ?? '', style: _themeData.textTheme.caption) else SizedBox(),
            if (title != null) SizedBox(height: 10) else SizedBox(),
            Text(subtitle, style: _textStyle?.apply(fontSizeDelta: -2, color: _themeData.primaryColor)),
            SizedBox(height: 5),
            Text(body, style: _textStyle?.apply(fontSizeDelta: -2)),
            additional ?? SizedBox()
          ],
        ),
      ),
    );
  }
}
