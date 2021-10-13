import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssignmentReportDownloadRow extends StatelessWidget {
  const AssignmentReportDownloadRow({Key? key, required this.fileName}) : super(key: key);
  final String fileName;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          spacing: 5,
          runAlignment: WrapAlignment.center,
          children: [
            Icon(FontAwesomeIcons.solidFilePdf, color: _themeData.accentColor),
            Text(fileName, style: _themeData.textTheme.overline?.copyWith(color: _themeData.primaryColor)),
          ],
        ),
        Icon(Icons.cloud_download_outlined, color: _themeData.accentColor),
      ],
    );
  }
}
