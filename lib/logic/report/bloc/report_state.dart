import 'package:equatable/equatable.dart';
import 'package:workflowz/constants/enums.dart';
import 'package:workflowz/domain/data/models/FullReport.dart';
import 'package:workflowz/domain/data/models/OrderFull.dart';
import 'package:workflowz/logic/report/bloc/report_submission_status.dart';

abstract class ReportState {
  final OrderFull? order;
  final FullReport? fullReport;
  final ReportSubmissionStatus reportSubmissionStatus;
  const ReportState({this.order, required this.reportSubmissionStatus, this.fullReport});
}

class ActedReport extends ReportState implements Equatable {
  ActedReport({
    OrderFull? order,
    required ReportSubmissionStatus reportSubmissionStatus,
  }) : super(order: order, reportSubmissionStatus: reportSubmissionStatus);

  ActedReport copyWith({OrderFull? order, ReportSubmissionStatus? reportSubmissionStatus}) {
    return ActedReport(
      order: order ?? this.order,
      reportSubmissionStatus: reportSubmissionStatus ?? this.reportSubmissionStatus,
    );
  }

  @override
  List<Object?> get props => [order, reportSubmissionStatus];

  @override
  bool? get stringify => true;
}

class FullReportState extends ReportState {
  final ReportType? reportType;

  FullReportState({
    this.reportType,
    required OrderFull? order,
    required FullReport fullReport,
    required ReportSubmissionStatus reportSubmissionStatus,
  }) : super(reportSubmissionStatus: reportSubmissionStatus, order: order, fullReport: fullReport);
}

class ReportInitial extends ReportState {
  ReportInitial({required ReportSubmissionStatus reportSubmissionStatus})
      : super(reportSubmissionStatus: reportSubmissionStatus);
}

class FinishedReport extends ReportState {
  FinishedReport({
    required OrderFull? order,
    required FullReport fullReport,
    required ReportSubmissionStatus reportSubmissionStatus,
  }) : super(reportSubmissionStatus: reportSubmissionStatus, order: order, fullReport: fullReport);

  FinishedReport copyWith({OrderFull? order, ReportSubmissionStatus? reportSubmissionStatus}) {
    return FinishedReport(
      fullReport: FullReport(),
      order: order ?? this.order,
      reportSubmissionStatus: reportSubmissionStatus ?? this.reportSubmissionStatus,
    );
  }
}
