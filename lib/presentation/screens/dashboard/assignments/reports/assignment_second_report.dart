import 'package:flutter/material.dart';
import 'package:workflowz/domain/data/models/Question.dart';
import 'package:workflowz/infrastructure/actions/order_actions.dart';
import 'package:workflowz/infrastructure/actions/report_actions.dart';
import 'package:workflowz/logic/order/bloc/order_bloc.dart';
import 'package:workflowz/logic/report/bloc/report_bloc.dart';
import 'package:workflowz/logic/report/bloc/report_state.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/components/report/assignment_report_separated_switch_list_view.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/components/report/assignment_report_simple_title.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/reports/assignment_third_report.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/scaffolds/assignment_report_screen_bootstrap_container.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/scaffolds/assignment_screen_scaffold.dart';
import 'package:workflowz/presentation/screens/shared/main_container.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';
import 'package:workflowz/presentation/widgets/progress_indicators/custom_circular_progress_indicator.dart';

class AssignmentSecondReportScreen extends StatefulWidget {
  const AssignmentSecondReportScreen({Key? key, required this.orderBloc, required this.reportBloc}) : super(key: key);
  final OrderBloc orderBloc;
  final ReportBloc reportBloc;

  @override
  _AssignmentSecondReportScreenState createState() => _AssignmentSecondReportScreenState();
}

class _AssignmentSecondReportScreenState extends State<AssignmentSecondReportScreen> {
  bool _isLoading = true;
  List<Question>? _questions = [];
  final Map<int, bool> _result = {};
  final OrderActions _orderActions = OrderActions();
  final ReportActions _reportActions = ReportActions();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _orderActions
        .fetchQuestions(apiOrderRepository: widget.orderBloc.orderRepo, id: widget.orderBloc.state.order!.id)
        .then((result) => setState(() {
              _questions = result?.where((q) => q.type == 'BOOLEAN').toList();
              _isLoading = false;
            }))
        .whenComplete(() => _questions!.forEach((q) => setState(() => _result[q.id] = true)));
  }

  void _onNext(ReportBloc bloc) {
    final FullReportState _state = bloc.state as FullReportState;
    final _updated = _state.fullReport!.copyWith(questions: _result);
    _reportActions.nextReport(bloc: bloc, fullReport: _updated, order: _state.order!);

    Navigator.push(
      context,
      MaterialPageRoute<Widget>(
        builder: (BuildContext context) => AssignmentThirdReportScreen(
          orderBloc: widget.orderBloc,
          reportBloc: widget.reportBloc,
        ),
      ),
    );
  }

  void _onChanged(bool v, int id) => setState(() => _result[id] = v);

  @override
  Widget build(BuildContext context) {
    return AssignmentReportScreenBootstrapContainer(
      orderBloc: widget.orderBloc,
      reportBloc: widget.reportBloc,
      child: AssignmentScreenScaffold(
        onNext: () => _onNext(widget.reportBloc),
        body: MainContainer(
          child: SingleChildScrollView(
            child: _isLoading
                ? CustomCircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomSpaces.verticalSpace,
                      AssignmentReportSimpleTitle('Room Check'),
                      CustomSpaces.verticalSpace,
                      CustomSpaces.verticalSpace,
                      AssignmentReportSeparatedSwitchListView(
                        result: _result,
                        onChanged: _onChanged,
                        options: _questions ?? [],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
