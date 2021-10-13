import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:workflowz/domain/data/constants/enums/OrderActionEnums.dart';
import 'package:workflowz/logic/report/api_report_repository.dart';

import '../../../domain/data/models/OrderFull.dart';

import '../api_order_repository.dart';
import 'order_event.dart';
import 'order_state.dart';
import 'order_submission_status.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final ApiOrderRepository orderRepo;
  final FlutterSecureStorage storage;
  final ApiReportRepository reportRepo;
  OrderBloc({required this.orderRepo, required this.reportRepo, required this.storage}) : super(OrderInitial());

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    /// Order show
    if (event is OrderClickedEvent) {
      yield state.copyWith(
        orderSubmissionStatus: OrderSubmissionStatusInProgress(),
      );

      try {
        final String? _token = await storage.read(key: 'token');
        final OrderFull orderFull = await orderRepo.show(_token!, event.orderId);

        yield state.copyWith(
          order: orderFull,
          orderSubmissionStatus: OrderSubmissionStatusShown(),
        );
      } catch (e) {
        yield state.copyWith(orderSubmissionStatus: OrderSubmissionStatusFailed(e));
      }
    }

    /// Order Accepted
    else if (event is OrderAcceptedEvent) {
      yield state.copyWith(
        orderSubmissionStatus: OrderSubmissionStatusInProgress(),
      );

      try {
        final String? _token = await storage.read(key: 'token');

        final OrderFull orderFull = await reportRepo.act(_token!, event.orderId, OrderActionEnums.ACCEPT);

        yield state.copyWith(
          order: orderFull,
          orderSubmissionStatus: OrderSubmissionStatusAccepted(),
        );
      } catch (e) {
        yield state.copyWith(orderSubmissionStatus: OrderSubmissionStatusFailed(e));
      }
    }

    /// Order Declined
    else if (event is OrderDeclinedEvent) {
      yield state.copyWith(
        orderSubmissionStatus: OrderSubmissionStatusInProgress(),
      );

      try {
        final String? _token = await storage.read(key: 'token');

        final OrderFull orderFull = await reportRepo.act(_token!, event.orderId, OrderActionEnums.DECLINE);

        yield state.copyWith(
          order: orderFull,
          orderSubmissionStatus: OrderSubmissionStatusDeclined(),
        );
      } catch (e) {
        yield state.copyWith(orderSubmissionStatus: OrderSubmissionStatusFailed(e));
      }
    }

    /// Order Changed | Act or smth else that can change the status of order
    else if (event is OrderChangedEvent) {
      try {
        yield state.copyWith(
          order: event.order,
          orderSubmissionStatus: OrderSubmissionStatusSuccess(),
        );
      } catch (e) {
        yield state.copyWith(orderSubmissionStatus: OrderSubmissionStatusFailed(e));
      }
    }
  }
}
