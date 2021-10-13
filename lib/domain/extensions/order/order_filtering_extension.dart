import 'package:workflowz/domain/data/models/contracts/AbstractOrder.dart';
import 'package:workflowz/domain/extensions/order/order_reporting_extension.dart';

abstract class OrderFilteringExtension {}

extension OrderParsing on List<AbstractOrder> {
  List<AbstractOrder> get getFinishedOrders {
    return where((AbstractOrder order) => order.isFinished).toList();
  }

  List<AbstractOrder> get getAssignedOrders {
    return where((AbstractOrder order) => order.isAssigned).toList();
  }
}
