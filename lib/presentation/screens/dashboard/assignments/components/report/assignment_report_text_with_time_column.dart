import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssignmentReportTextWithTimeColumn extends StatelessWidget {
  const AssignmentReportTextWithTimeColumn({Key? key, this.text, required this.time}) : super(key: key);
  final String? text;
  final String time;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Column(
      children: [
        if (text != null)
          Text(
            text.toString(),
            style: _themeData.textTheme.caption?.apply(fontSizeDelta: -2, color: _themeData.primaryColor),
          )
        else
          SizedBox(),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.clock, color: _themeData.accentColor),
            SizedBox(width: 5),
            Text(time, style: _themeData.textTheme.caption?.apply(fontSizeDelta: -2)),
          ],
        ),
      ],
    );
  }
}
