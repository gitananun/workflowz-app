import '../../../domain/data/models/OrderFull.dart';

abstract class OrderEvent {
  final int orderId;

  OrderEvent({required this.orderId});
}

class OrderInitialEvent extends OrderEvent {
  final OrderFull order;

  OrderInitialEvent({required this.order}) : super(orderId: order.id);
}

class OrderClickedEvent extends OrderEvent {
  final int id;

  OrderClickedEvent({required this.id}) : super(orderId: id);
}

class OrderAcceptedEvent extends OrderEvent {
  final int id;

  OrderAcceptedEvent({required this.id}) : super(orderId: id);
}

class OrderDeclinedEvent extends OrderEvent {
  final int id;

  OrderDeclinedEvent({required this.id}) : super(orderId: id);
}

class OrderChangedEvent extends OrderEvent {
  final OrderFull order;

  OrderChangedEvent({required this.order}) : super(orderId: order.id);
}

class OrderFinishedEvent extends OrderEvent {
  final int id;

  OrderFinishedEvent({required this.id}) : super(orderId: id);
}
