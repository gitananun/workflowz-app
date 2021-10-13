import 'package:flutter/material.dart';
import 'package:workflowz/presentation/extensions/string_extension.dart';
import '../../../../../../domain/data/models/OrderFull.dart';

class AssignmentTitleSection extends StatelessWidget {
  const AssignmentTitleSection({Key? key, required this.order, this.address}) : super(key: key);
  final OrderFull order;
  final String? address;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    final TextStyle? _smallTextStyle = _themeData.textTheme.caption?.apply(
      color: _themeData.primaryColor,
      fontSizeDelta: -2,
    );

    return Wrap(
      spacing: 5,
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(order.orderStatus!.status.parseSnakeCase(), style: _smallTextStyle),
        Text(order.product!.name, style: _themeData.textTheme.bodyText2),
        Text('montage', style: _smallTextStyle),
        if (address != null)
          Text('Address: $address', style: _smallTextStyle?.copyWith(color: Colors.white))
        else
          SizedBox()
      ],
    );
  }
}
