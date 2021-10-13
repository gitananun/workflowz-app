import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workflowz/domain/extensions/order/order_parsing_extension.dart';

import '../../../../../domain/data/models/Order.dart';
import '../../../../../infrastructure/actions/order_actions.dart';
import '../../../../../logic/order/bloc/order_bloc.dart';
import '../../../../../logic/order/bloc/order_state.dart';

import '../../../../widgets/containers/custom_main_decorated_container.dart';
import 'assignment_item_footer_section.dart';
import 'assignment_item_title_section.dart';

class AssignmentsAssignmentItem extends StatelessWidget {
  const AssignmentsAssignmentItem({
    Key? key,
    required this.order,
    required this.onTap,
    required this.orderActions,
  }) : super(key: key);
  final Order order;
  final OrderActions orderActions;
  final GestureTapCallback? onTap;

  void onDecline(OrderBloc orderBloc) {
    HapticFeedback.mediumImpact();
    orderActions.decline(bloc: orderBloc, id: order.id);
  }

  void onAccept(OrderBloc orderBloc) {
    HapticFeedback.mediumImpact();
    orderActions.accept(bloc: orderBloc, id: order.id);
    orderActions.show(bloc: orderBloc, id: order.id);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextStyle _textStyle = _themeData.textTheme.caption!;

    return GestureDetector(
      onTap: onTap,
      child: IntrinsicHeight(
        child: CustomMainDecoratedContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AssignmentItemTitleSection(textStyle: _textStyle, name: order.productName),
              SizedBox(height: 15),
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  final OrderBloc orderBloc = context.read<OrderBloc>();
                  return AssignmentItemFooterSection(
                    order: order,
                    textStyle: _textStyle,
                    fullStartDate: order.getStartDate,
                    onAccept: () => onAccept(orderBloc),
                    onDecline: () => onDecline(orderBloc),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
