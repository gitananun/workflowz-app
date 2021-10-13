import 'package:flutter/material.dart';

class AssignmentReportNextStepTextWithIcon extends StatelessWidget {
  const AssignmentReportNextStepTextWithIcon(this.text, {Key? key, this.onTap}) : super(key: key);
  final String text;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(text, style: _themeData.textTheme.caption),
          Icon(Icons.arrow_right_alt_sharp, color: _themeData.accentColor),
        ],
      ),
    );
  }
}
