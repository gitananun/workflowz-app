import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workflowz/domain/extensions/order/order_reporting_extension.dart';
import '../../../../../../../logic/orders/bloc/orders_cubit.dart';
import '../../../../../../../logic/orders/bloc/orders_state.dart';

import '../../../../../../widgets/charts/custom_bordered_pie_chart_container.dart';
import '../../../../../../widgets/containers/custom_main_decorated_container.dart';
import 'chart/home_first_grid_pie_chart.dart';

class HomeGridSecondRowContainerRightContainer extends StatelessWidget {
  const HomeGridSecondRowContainerRightContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle? _textStyle = Theme.of(context).textTheme.caption?.apply(fontSizeDelta: -2);

    return CustomMainDecoratedContainer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Today Orders', style: _textStyle),
            SizedBox(height: 10),
            BlocBuilder<OrdersCubit, OrdersState>(
              buildWhen: (_, state) => state is OrdersSuccess,
              builder: (_, state) {
                final ordersState = state as OrdersSuccess;
                final orders = ordersState.orders;
                final forTodayPercentage = (orders.length / orders.map((e) => e.isDueToday).length) * 100;

                return Center(
                  child: CustomBorderedPieChartContainer(
                    size: 80,
                    pieChart: HomeFirstGridPieChart(value: forTodayPercentage),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
