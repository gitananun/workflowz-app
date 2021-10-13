import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workflowz/domain/data/models/Order.dart';
import 'package:workflowz/domain/extensions/order/order_filtering_extension.dart';
import 'package:workflowz/presentation/screens/dashboard/assignments/components/assignments_list_view.dart';
import 'package:workflowz/presentation/widgets/scaffold/fab/custom_fancy_fab.dart';

import '../../../../infrastructure/actions/orders_actions.dart';
import '../../../../logic/orders/bloc/orders_cubit.dart';
import '../../../../logic/orders/bloc/orders_state.dart';
import '../../../../logic/session/bloc/session_cubit.dart';
import '../../../Styles/custom_spaces.dart';
import '../../../screens/shared/main_container.dart';
import '../../../widgets/progress_indicators/custom_circular_progress_indicator.dart';
import '../../../widgets/shared/custom_failure_state_column.dart';
import 'components/grid/home_first_grid_column.dart';
import 'components/home_welcome_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final OrdersActions _orderActions = OrdersActions();

  @override
  void initState() {
    super.initState();
    _orderActions.index(context.read<OrdersCubit>());
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticatedSession _authenticatedState = context.read<SessionCubit>().state as AuthenticatedSession;

    return Scaffold(
      floatingActionButton: CustomFancyFab(onPressed: () {}),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersSuccess) {
            return SingleChildScrollView(
              child: MainContainer(
                child: Column(
                  children: [
                    HomeWelcomeText(name: _authenticatedState.user.firstName),
                    CustomSpaces.verticalSpace,
                    HomeFirstGridColumn(),
                    AssignmentsListView(orders: state.orders.getAssignedOrders as List<Order>),
                  ],
                ),
              ),
            );
          } else if (state is OrdersInProgress) {
            return CustomCircularProgressIndicator();
          } else if (state is OrdersFailure) {
            return CustomFailureStateColumn(state: state, exception: state.exception);
          }

          return CustomCircularProgressIndicator();
        },
      ),
    );
  }
}
