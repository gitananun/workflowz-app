import 'package:equatable/equatable.dart';
import '../../../domain/data/models/Order.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersInProgress extends OrdersState {}

class OrdersSuccess extends Equatable implements OrdersState {
  final List<Order> orders;
  const OrdersSuccess(this.orders);

  @override
  List<Object?> get props => [orders];
}

class OrdersFailure extends OrdersState {
  final dynamic exception;

  OrdersFailure(this.exception);
}
