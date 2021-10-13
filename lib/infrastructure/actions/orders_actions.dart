import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../logic/orders/api_orders_repository.dart';
import '../../logic/orders/bloc/orders_cubit.dart';

class OrdersActions {
  final ApiOrdersRepository _apiOrdersRepository = ApiOrdersRepository();

  ///
  Future<void> index(OrdersCubit cubit) async {
    final storage = FlutterSecureStorage();
    final String? token = await storage.read(key: 'token');

    cubit.ordersInProgress();
    try {
      cubit.ordersSuccess(await _apiOrdersRepository.index(token!));
    } catch (e) {
      cubit.ordersFailure(e);
    }
  }
}
