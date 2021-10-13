import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workflowz/domain/extensions/order/order_reporting_extension.dart';

import '../../../../../domain/data/models/Order.dart';
import '../../../../../infrastructure/actions/order_actions.dart';
import '../../../../../logic/order/bloc/order_bloc.dart';
import '../../../../../logic/order/bloc/order_state.dart';
import '../../../../../logic/order/bloc/order_submission_status.dart';
import '../../../../Styles/custom_spaces.dart';
import '../../../../widgets/snackbar/custom_snackbars.dart';
import '../assignment.dart';
import 'assignment_item.dart';

class AssignmentsListView extends StatefulWidget {
  const AssignmentsListView({Key? key, required this.orders, this.isCompletedList = false}) : super(key: key);
  final bool isCompletedList;
  final List<Order> orders;

  @override
  _AssignmentsListViewState createState() => _AssignmentsListViewState();
}

class _AssignmentsListViewState extends State<AssignmentsListView> {
  final OrderActions _orderActions = OrderActions();

  void _resolveListener(BuildContext context, OrderState state) {
    final CustomSnackbars _customSnackbars = CustomSnackbars(context);

    switch (state.orderSubmissionStatus.runtimeType) {
      case OrderSubmissionStatusShown:
        Navigator.push(
          context,
          MaterialPageRoute<AssignmentScreen>(
            builder: (_) => AssignmentScreen(orderBloc: context.read<OrderBloc>()),
          ),
        );
        break;
      case OrderSubmissionStatusAccepted:
        _customSnackbars.showSuccessMessageSnackbar('Order Accepted Successfully!');
        break;
      case OrderSubmissionStatusDeclined:
        _customSnackbars.showSuccessMessageSnackbar('Order Declined Successfully!');

        break;
      case OrderSubmissionStatusFailed:
        final submissionStatus = state.orderSubmissionStatus as OrderSubmissionStatusFailed;
        _customSnackbars.showMessageSnackbar(submissionStatus.e.toString());
        break;
    }
  }

  void _onTapAssignment(BuildContext context, OrderSubmissionStatus orderSubmissionStatus, Order order) {
    if (widget.isCompletedList || orderSubmissionStatus is OrderSubmissionStatusInProgress || order.reportInitial) {
      HapticFeedback.mediumImpact();
    } else {
      HapticFeedback.mediumImpact();
      _orderActions.show(bloc: context.read<OrderBloc>(), id: order.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: _resolveListener,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.orders.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int i) {
          return Container(
            margin: const EdgeInsets.only(top: CustomSpaces.listViewSpaceBtw),
            child: AssignmentsAssignmentItem(
              order: widget.orders[i],
              orderActions: _orderActions,
              onTap: () =>
                  _onTapAssignment(context, context.read<OrderBloc>().state.orderSubmissionStatus, widget.orders[i]),
            ),
          );
        },
      ),
    );
  }
}
