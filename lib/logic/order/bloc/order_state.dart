import 'package:equatable/equatable.dart';
import '../../../domain/data/models/OrderFull.dart';
import 'order_submission_status.dart';

class OrderState extends Equatable {
  final OrderFull? order;
  final OrderSubmissionStatus orderSubmissionStatus;

  const OrderState({
    this.order,
    required this.orderSubmissionStatus,
  });

  OrderState copyWith({
    OrderFull? order,
    OrderSubmissionStatus? orderSubmissionStatus,
  }) {
    return OrderState(
      order: order ?? this.order,
      orderSubmissionStatus: orderSubmissionStatus ?? this.orderSubmissionStatus,
    );
  }

  @override
  List<Object?> get props => [order];
}

class OrderInitial extends OrderState {
  OrderInitial() : super(orderSubmissionStatus: OrderSubmissionStatusInitial());
}
