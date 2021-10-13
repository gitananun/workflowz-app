import 'package:flutter/material.dart';
import 'package:workflowz/domain/data/constants/enums/OrderActionEnums.dart';
import 'package:workflowz/domain/extensions/order/order_parsing_extension.dart';
import 'package:workflowz/presentation/styles/custom_spaces.dart';

import '../../../../../../domain/data/models/OrderFull.dart';
import 'assignment_address_container.dart';

class AssignmentAddressesColumn extends StatelessWidget {
  const AssignmentAddressesColumn({
    Key? key,
    required this.order,
    required this.onStartAddress,
    required this.onFinishAddress,
  }) : super(key: key);
  final OrderFull order;
  final GestureTapCallback onStartAddress;
  final GestureTapCallback onFinishAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AssignmentAddressContainer(
          onTap: onStartAddress,
          fullDate: order.getStartDate,
          address: 'Start montage',
          enabled: order.orderStatus!.actions!.isEmpty
              ? false
              : order.orderStatus?.actions?.first.action == OrderActionEnums.ADDRESS_START.parseToString(),
        ),
        CustomSpaces.verticalSpace,
        AssignmentAddressContainer(
          onTap: onFinishAddress,
          fullDate: order.getFinishDate,
          address: 'End montage',
          enabled: order.orderStatus!.actions!.isEmpty
              ? false
              : order.orderStatus!.actions!.first.action == OrderActionEnums.FINISH.parseToString(),
        ),
      ],
    );
  }
}
