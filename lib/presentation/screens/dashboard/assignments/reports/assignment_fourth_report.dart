import 'package:flutter/material.dart';
import 'package:workflowz/infrastructure/actions/report_actions.dart';
import 'package:workflowz/logic/report/bloc/report_state.dart';
import 'package:workflowz/logic/order/bloc/order_bloc.dart';
import 'package:workflowz/logic/report/bloc/report_bloc.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/components/report/assignment_report_simple_title.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/reports/assignment_fivth_report.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/scaffolds/assignment_report_screen_bootstrap_container.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/scaffolds/assignment_screen_scaffold.dart';
import 'package:workflowz/presentation/screens/shared/main_container.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';
import 'package:workflowz/presentation/widgets/form/text_fields/custom_text_form_field.dart';

class AssignmentFourthReportScreen extends StatefulWidget {
  const AssignmentFourthReportScreen({Key? key, required this.reportBloc, required this.orderBloc}) : super(key: key);
  final OrderBloc orderBloc;
  final ReportBloc reportBloc;

  @override
  _AssignmentFourthReportScreenState createState() => _AssignmentFourthReportScreenState();
}

class _AssignmentFourthReportScreenState extends State<AssignmentFourthReportScreen> {
  final ReportActions _reportActions = ReportActions();
  final TextEditingController _textController = TextEditingController();

  void _onNext(ReportBloc bloc) {
    final FullReportState _state = bloc.state as FullReportState;
    final _updated = _state.fullReport!.copyWith(damagedItems: _textController.text);
    _reportActions.nextReport(bloc: bloc, fullReport: _updated, order: _state.order!);

    Navigator.push(
      context,
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => AssignmentFivthReportScreen(
          reportBloc: widget.reportBloc,
          orderBloc: widget.orderBloc,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                AssignmentReportSimpleTitle('Which items are damaged?'),
                CustomSpaces.verticalSpace,
                CustomSpaces.verticalSpace,
                CustomTextFormField(
                  validator: null,
                  labelText: 'Items',
                  controller: _textController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
