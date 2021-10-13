import 'package:workflowz/domain/data/constants/enums/OrderActionEnums.dart';
import 'package:workflowz/domain/data/constants/enums/OrderStatusEnums.dart';
import 'package:workflowz/domain/data/models/OrderAction.dart';
import 'package:workflowz/domain/data/models/contracts/AbstractOrder.dart';

abstract class OrderReportingExtension {}

extension OrderReporting on AbstractOrder {
  List<String> get initialReportActions => [
        OrderActionEnums.ACCEPT.parseToString(),
        OrderActionEnums.DECLINE.parseToString(),
      ];

  List<String> get orderInfoReportActions => [
        OrderActionEnums.ADDRESS_START.parseToString(),
      ];

  List<String> get startedReportActions => [
        OrderActionEnums.FINISH.parseToString(),
      ];

  bool get reportInitial =>
      orderStatus!.actions!.map((OrderAction e) => initialReportActions.contains(e.action)).any((v) => v);

  bool get onOrderInfoReport =>
      orderStatus!.actions!.map((OrderAction e) => orderInfoReportActions.contains(e.action)).any((v) => v);

  bool get onStartedReport =>
      orderStatus!.actions!.map((OrderAction e) => startedReportActions.contains(e.action)).any((v) => v);

  bool get isFinished => orderStatus?.actions?.isEmpty ?? false;

  bool get isAssigned => !isFinished;

  bool get isStarted => orderStatus?.actions?.first.action != OrderActionEnums.MORNING_START.parseToString();

  bool get isAccepted => orderStatus?.status != OrderStatusEnums.NEW.parseToString();

  bool get isDueToday => DateTime.fromMillisecondsSinceEpoch(startTimeMillis) == DateTime.now();
}
