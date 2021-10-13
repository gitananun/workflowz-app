import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../logic/orders/bloc/orders_cubit.dart';
import '../../../../../../../logic/orders/bloc/orders_state.dart';
import '../../../../../../widgets/containers/custom_main_decorated_container.dart';
import 'home_grid_container_text_column.dart';

class HomeGridSecondRowContainerLeftContainer extends StatelessWidget {
  const HomeGridSecondRowContainerLeftContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _now = DateTime.now();

    return CustomMainDecoratedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeGridContainerTextColumn(
            firstText: 'Orders',
            withUnderline: false,
            secondText: DateFormat('MMMM yyyy').format(_now),
          ),
          BlocBuilder<OrdersCubit, OrdersState>(
            buildWhen: (_, state) => state is OrdersSuccess,
            builder: (context, state) {
              final ordersState = state as OrdersSuccess;
              return Text('${ordersState.orders.length} Orders', style: Theme.of(context).textTheme.bodyText2);
            },
          )
        ],
      ),
    );
  }
}
