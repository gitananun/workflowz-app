import 'package:flutter/material.dart';
import 'package:workflowz/logic/order/bloc/order_bloc.dart';
import 'package:workflowz/logic/report/bloc/report_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentReportScreenBootstrapContainer extends StatelessWidget {
  const AssignmentReportScreenBootstrapContainer(
      {Key? key, required this.orderBloc, required this.reportBloc, required this.child})
      : super(key: key);
  final Widget child;
  final OrderBloc orderBloc;
  final ReportBloc reportBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: orderBloc),
        BlocProvider.value(value: reportBloc),
      ],
      child: child,
    );
  }
}
