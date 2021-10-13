import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:workflowz/domain/data/models/Question.dart';
import 'package:workflowz/logic/order/api_order_repository.dart';

import '../../logic/order/bloc/order_bloc.dart';
import '../../logic/order/bloc/order_event.dart';

class OrderActions {
  ///
  void show({required OrderBloc bloc, required int id}) {
    bloc.add(OrderClickedEvent(id: id));
  }

  ///
  void accept({required OrderBloc bloc, required int id}) {
    bloc.add(OrderAcceptedEvent(id: id));
  }

  ///
  void decline({required OrderBloc bloc, required int id}) {
    bloc.add(OrderDeclinedEvent(id: id));
  }

  ///
  Future<List<Question>?> fetchQuestions({required ApiOrderRepository apiOrderRepository, required int id}) async {
    final FlutterSecureStorage _storage = FlutterSecureStorage();
    final String? _token = await _storage.read(key: 'token');

    return apiOrderRepository.fetchQuestions(_token ?? '', id);
  }
}
