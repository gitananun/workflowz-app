import 'package:workflowz/constants/enums.dart';
import 'package:workflowz/domain/data/constants/enums/OrderActionEnums.dart';
import 'package:workflowz/domain/data/models/FullReport.dart';
import 'package:workflowz/domain/data/models/OrderFull.dart';
import 'package:workflowz/logic/report/bloc/report_bloc.dart';
import 'package:workflowz/logic/report/bloc/report_event.dart';
import 'package:workflowz/logic/report/bloc/report_state.dart';

class ReportActions {
  void act({
    required int id,
    required ReportBloc bloc,
    required OrderActionEnums action,
  }) {
    bloc.add(ReportActed(id: id, action: action));
  }

  void startReport({required ReportBloc bloc, required OrderFull order, required ReportType reportType}) {
    bloc.add(ReportStarted(order: order, reportType: reportType));
  }

  void nextReport({
    required ReportBloc bloc,
    required OrderFull order,
    required FullReport fullReport,
  }) {
    if (bloc.state is FullReportState) {
      bloc.add(ReportPassed(
        order: order,
        fullReport: fullReport,
        reportType: (bloc.state as FullReportState).reportType,
      ));
    }
  }

  void finishReport({required ReportBloc bloc, required FullReport fullReport, required OrderFull order}) {
    bloc.add(ReportFinished(fullReport: fullReport, order: order));
  }
}
