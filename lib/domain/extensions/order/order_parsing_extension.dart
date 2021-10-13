import 'package:workflowz/domain/data/models/contracts/AbstractOrder.dart';

abstract class OrderParsingExtension {}

extension OrderParsing on AbstractOrder {
  String? get getStartAddress => employee?.location?.city.toString();

  String? get getFinishAddress => address?.city.toString();

  DateTime get getStartDate => DateTime.fromMillisecondsSinceEpoch(startTimeMillis);

  DateTime get getFinishDate => DateTime.fromMillisecondsSinceEpoch(finishTimeMillis);
}
