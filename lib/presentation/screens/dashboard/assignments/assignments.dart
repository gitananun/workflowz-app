import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workflowz/domain/data/models/Order.dart';
import 'package:workflowz/domain/extensions/order/order_filtering_extension.dart';
import 'package:workflowz/logic/orders/bloc/orders_cubit.dart';
import 'package:workflowz/logic/orders/bloc/orders_state.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/components/assignments_list_view.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';
import 'package:workflowz/presentation/widgets/progress_indicators/custom_circular_progress_indicator.dart';
import 'package:workflowz/presentation/widgets/shared/custom_failure_state_column.dart';

import '../../../../infrastructure/actions/orders_actions.dart';
import '../../../widgets/scaffold/fab/custom_fancy_fab.dart';

class AssignmentsScreen extends StatefulWidget {
  const AssignmentsScreen({Key? key}) : super(key: key);

  @override
  _AssignmentsScreenState createState() => _AssignmentsScreenState();
}

class _AssignmentsScreenState extends State<AssignmentsScreen> with TickerProviderStateMixin {
  final OrdersActions _ordersActions = OrdersActions();

  @override
  void initState() {
    super.initState();
    _ordersActions.index(context.read<OrdersCubit>());
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Scaffold(
      floatingActionButton: CustomFancyFab(onPressed: () {}),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            CustomSpaces.verticalSpace,
            Text(
              'Complete Assignments',
              style: _themeData.textTheme.caption?.copyWith(color: _themeData.primaryColor),
            ),
            CustomSpaces.verticalSpace,
            Expanded(
              child: BlocBuilder<OrdersCubit, OrdersState>(
                builder: (context, state) {
                  if (state is OrdersSuccess) {
                    return AssignmentsListView(
                      orders: state.orders.getFinishedOrders as List<Order>,
                      isCompletedList: true,
                    );
                  } else if (state is OrdersInProgress) {
                    return CustomCircularProgressIndicator();
                  } else if (state is OrdersFailure) {
                    return CustomFailureStateColumn(state: state, exception: state.exception);
                  }

                  return CustomCircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
