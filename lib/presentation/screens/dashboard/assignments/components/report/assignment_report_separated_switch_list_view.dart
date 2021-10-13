import 'package:flutter/material.dart';
import 'package:workflowz/domain/data/models/Question.dart';

class AssignmentReportSeparatedSwitchListView extends StatefulWidget {
  const AssignmentReportSeparatedSwitchListView({
    Key? key,
    required this.result,
    required this.options,
    required this.onChanged,
  }) : super(key: key);
  final List<Question> options;
  final Map<int, bool>? result;
  final Function(bool v, int id) onChanged;

  @override
  _AssignmentReportSeparatedSwitchListViewState createState() => _AssignmentReportSeparatedSwitchListViewState();
}

class _AssignmentReportSeparatedSwitchListViewState extends State<AssignmentReportSeparatedSwitchListView> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.options.length,
      separatorBuilder: (_, __) => Divider(thickness: 0.2, height: 0, color: _themeData.accentColor),
      itemBuilder: (BuildContext context, int i) => SwitchListTile(
        activeColor: _themeData.accentColor,
        inactiveTrackColor: _themeData.cardColor,
        activeTrackColor: _themeData.primaryColor,
        value: widget.result?[widget.options[i].id] ?? true,
        onChanged: (v) => widget.onChanged(v, widget.options[i].id),
        title: Text(widget.options[i].label, style: _themeData.textTheme.caption),
      ),
    );
  }
}
