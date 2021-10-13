import 'package:workflowz/infrastructure/exceptions/EnumException.dart';

enum OrderActionEnums {
  ACCEPT,
  DECLINE,
  MORNING_START,
  ADDRESS_START,
  START_ADMINISTRATION,
  ARRIVE,
  FINISH,
  NEED_TRANSPORTATION,
}

extension OrderActionExtension on OrderActionEnums {
  String parseToString() => toString().split('.').last;
}

extension OrderActionFromStringExtension on String {
  OrderActionEnums toOrderAction() {
    final OrderActionEnums? casted = OrderActionEnums.values.firstWhere(
      (e) => e.toString() == 'OrderActionEnums.${toString()}',
    );

    if (casted != null) return casted;

    throw EnumException('No OrderActionEnum with the name $this');
  }
}
