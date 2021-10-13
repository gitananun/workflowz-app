import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workflowz/logic/order/bloc/order_bloc.dart';
import 'package:workflowz/logic/order/bloc/order_state.dart';
import 'package:workflowz/presentation/widgets/buttons/custom_circular_gradient_icon_button.dart';
import 'package:workflowz/presentation/widgets/containers/custom_main_decorated_container.dart';

import '../../../../../Styles/custom_spaces.dart';
import '../../../../../extensions/date_time_extension.dart';

class AssignmentAddressContainer extends StatelessWidget {
  const AssignmentAddressContainer({
    Key? key,
    required this.onTap,
    required this.address,
    required this.enabled,
    required this.fullDate,
  }) : super(key: key);

  final bool enabled;
  final String address;
  final DateTime fullDate;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    const double _iconSize = 15;

    return CustomMainDecoratedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.route, color: Colors.grey[400]),
                    SizedBox(width: 5),
                    Text(address, style: _themeData.textTheme.caption?.apply(fontSizeDelta: -3))
                  ],
                ),
                CustomSpaces.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.calendarAlt, color: _themeData.accentColor, size: _iconSize),
                    SizedBox(width: 3),
                    Text(fullDate.getDate, style: _themeData.textTheme.caption?.apply(fontSizeDelta: -3)),
                    SizedBox(width: 5),
                    Icon(FontAwesomeIcons.clock, color: _themeData.accentColor, size: _iconSize),
                    SizedBox(width: 3),
                    Text(fullDate.getTime, style: _themeData.textTheme.caption?.apply(fontSizeDelta: -3))
                  ],
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  final bool _areActions = state.order?.orderStatus?.actions?.isNotEmpty ?? false;

                  return GestureDetector(
                    onTap: (_areActions && enabled) ? onTap : () {},
                    child: Icon(
                      enabled
                          ? Icons.arrow_forward
                          : !_areActions
                              ? Icons.check
                              : Icons.close,
                      color: _themeData.primaryColor,
                    ),
                  );
                },
              ),
              CustomSpaces.verticalSpace,
              CustomCircularGradientIconButton(icon: Icons.map_outlined, size: 8),
            ],
          ),
        ],
      ),
    );
  }
}
