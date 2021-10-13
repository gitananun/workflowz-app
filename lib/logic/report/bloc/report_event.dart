import 'package:workflowz/constants/enums.dart';
import 'package:workflowz/domain/data/constants/enums/OrderActionEnums.dart';
import 'package:workflowz/domain/data/models/FullReport.dart';
import 'package:workflowz/domain/data/models/OrderFull.dart';

class ReportEvent {
  final int orderId;

  const ReportEvent({required this.orderId});
}

class ReportActed extends ReportEvent {
  final int id;
  final OrderActionEnums action;

  ReportActed({required this.id, required this.action}) : super(orderId: id);
}

class ReportStarted extends ReportEvent {
  final OrderFull order;
  final ReportType reportType;
  ReportStarted({required this.order, required this.reportType}) : super(orderId: order.id);
}

class ReportPassed extends ReportEvent {
  final OrderFull order;
  final FullReport fullReport;
  final ReportType? reportType;

  ReportPassed({required this.fullReport, required this.order, this.reportType}) : super(orderId: order.id);
}

class ReportFinished extends ReportEvent {
  final OrderFull order;
  final FullReport fullReport;

  ReportFinished({required this.fullReport, required this.order}) : super(orderId: order.id);
}
