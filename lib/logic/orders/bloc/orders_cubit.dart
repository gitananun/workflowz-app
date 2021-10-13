import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/data/models/Order.dart';

import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  void ordersInProgress() => emit(OrdersInProgress());

  void ordersSuccess(List<Order> orders) => emit(OrdersSuccess(orders));

  void ordersFailure(dynamic exception) => emit(OrdersFailure(exception));
}
