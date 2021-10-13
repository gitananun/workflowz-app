import 'package:flutter/material.dart';

class AssignmentReportSimpleTitle extends StatelessWidget {
  const AssignmentReportSimpleTitle(this.title, {Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            color: Theme.of(context).primaryColor,
          ),
    );
  }
}
