import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:workflowz/domain/extensions/order/order_reporting_extension.dart';

import '../../../../../../infrastructure/Providers/AssetsPathProvider.dart';
import '../../../../../../logic/orders/bloc/orders_cubit.dart';
import '../../../../../../logic/orders/bloc/orders_state.dart';
import '../../../../../Styles/custom_spaces.dart';
import '../../../../../widgets/containers/custom_main_decorated_container.dart';
import 'components/home_grid_container_text_column.dart';

class HomeFirstGridContainer extends StatelessWidget {
  const HomeFirstGridContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _now = DateTime.now();

    return CustomMainDecoratedContainer(
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<OrdersCubit, OrdersState>(
              buildWhen: (_, state) => state is OrdersSuccess,
              builder: (_, state) {
                final ordersState = state as OrdersSuccess;
                return HomeGridContainerTextColumn(
                  firstText: DateFormat('EEEE, dd.MM.yyyy').format(_now),
                  secondText: 'You have ${ordersState.orders.map((e) => e.isDueToday).length} assignments today.',
                );
              },
            ),
          ),
          CustomSpaces.horizontalSpace,
          Expanded(
            child: SvgPicture.asset(
              AssetsPathProvider().getHome('settings_standing_person.svg'),
            ),
          )
        ],
      ),
    );
  }
}
