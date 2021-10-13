import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:workflowz/infrastructure/actions/report_actions.dart';
import 'package:workflowz/logic/order/bloc/order_bloc.dart';
import 'package:workflowz/logic/report/bloc/report_bloc.dart';
import 'package:workflowz/logic/report/bloc/report_state.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/components/assignment/assignment_comment_form_with_file_attach.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/components/report/assignment_report_simple_title.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/reports/assignment_fourth_report.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/scaffolds/assignment_report_screen_bootstrap_container.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/scaffolds/assignment_screen_scaffold.dart';
import 'package:workflowz/presentation/screens/shared/main_container.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';

class AssignmentThirdReportScreen extends StatefulWidget {
  const AssignmentThirdReportScreen({Key? key, required this.orderBloc, required this.reportBloc}) : super(key: key);
  final OrderBloc orderBloc;
  final ReportBloc reportBloc;

  @override
  _AssignmentThirdReportScreenState createState() => _AssignmentThirdReportScreenState();
}

class _AssignmentThirdReportScreenState extends State<AssignmentThirdReportScreen> {
  final List<File?> _files = [];
  final ReportActions _reportActions = ReportActions();
  final TextEditingController _commentController = TextEditingController();

  void _onNext(ReportBloc bloc) {
    final FullReportState _state = bloc.state as FullReportState;
    final _updated = _state.fullReport!.copyWith(
      damages: _files,
      comments: [..._state.fullReport?.comments ?? [], _commentController.text],
    );
    _reportActions.nextReport(bloc: bloc, fullReport: _updated, order: _state.order!);

    Navigator.push(
      context,
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => AssignmentFourthReportScreen(
          reportBloc: widget.reportBloc,
          orderBloc: widget.orderBloc,
        ),
      ),
    );
  }

  Future _pickFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      _files.addAll(result.paths.map((String? path) => File(path!)));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return AssignmentReportScreenBootstrapContainer(
      orderBloc: widget.orderBloc,
      reportBloc: widget.reportBloc,
      child: AssignmentScreenScaffold(
        onNext: () => _onNext(widget.reportBloc),
        body: MainContainer(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomSpaces.verticalSpace,
                AssignmentReportSimpleTitle('Damages'),
                CustomSpaces.verticalSpace,
                CustomSpaces.verticalSpace,
                CustomSpaces.verticalSpace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Attach files or add comments',
                    style: _themeData.textTheme.caption?.apply(fontSizeDelta: -3),
                  ),
                ),
                CustomSpaces.verticalSpace,
                AssignmentCommentFormWithFileAttach(
                  controller: _commentController,
                  onPressed: _pickFile,
                ),
                CustomSpaces.verticalSpace,
                if (_files.isNotEmpty)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Attached files: ${_files.length}',
                      style: _themeData.textTheme.caption?.apply(fontSizeDelta: -3),
                    ),
                  )
                else
                  SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
