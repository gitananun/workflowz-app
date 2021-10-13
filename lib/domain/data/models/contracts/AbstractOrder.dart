import 'package:workflowz/domain/data/models/Location.dart';

import '../Employee.dart';
import '../OrderStatus.dart';

abstract class AbstractOrder {
  final Employee? employee;
  final Location? address;
  final int startTimeMillis;
  final int finishTimeMillis;
  final OrderStatus? orderStatus;

  const AbstractOrder({
    required this.address,
    required this.employee,
    required this.orderStatus,
    required this.startTimeMillis,
    required this.finishTimeMillis,
  });
}
