import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workflowz/domain/data/models/Order.dart';
import 'package:workflowz/domain/extensions/order/order_reporting_extension.dart';
import 'package:workflowz/presentation/extensions/string_extension.dart';

import '../../../../extensions/date_time_extension.dart';
import 'assignment_item_footer_buttons_row.dart';

class AssignmentItemFooterSection extends StatelessWidget {
  const AssignmentItemFooterSection({
    Key? key,
    required this.order,
    required this.onAccept,
    required this.onDecline,
    required this.textStyle,
    required this.fullStartDate,
  }) : super(key: key);
  final Order order;
  final TextStyle textStyle;
  final DateTime fullStartDate;
  final VoidCallback? onDecline;
  final VoidCallback? onAccept;

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyleWithDelta = textStyle.apply(fontSizeDelta: -4);
    const double _commonSpacing = 5;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Wrap(
            spacing: _commonSpacing,
            children: [
              Wrap(
                spacing: _commonSpacing,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _AssignmentItemFooterIcon(FontAwesomeIcons.calendarAlt, _textStyleWithDelta),
                  Text('${fullStartDate.getDate} ', style: _textStyleWithDelta),
                ],
              ),

              ///
              Wrap(
                spacing: _commonSpacing,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _AssignmentItemFooterIcon(FontAwesomeIcons.clock, _textStyleWithDelta),
                  Text('${fullStartDate.getTime} ', style: _textStyleWithDelta),
                ],
              ),
            ],
          ),
        ),
        if (order.reportInitial)
          AssignmentItemFooterButtonsRow(onDecline: onDecline, onAccept: onAccept)

        ///
        else
          Expanded(
            child: Text(
              order.orderStatus!.status.parseSnakeCase(),
              textAlign: TextAlign.end,
              style: _textStyleWithDelta,
              overflow: TextOverflow.ellipsis,
            ),
          ),
      ],
    );
  }
}

class _AssignmentItemFooterIcon extends StatelessWidget {
  const _AssignmentItemFooterIcon(this.icon, this.textStyleWithDelta, {Key? key}) : super(key: key);

  final TextStyle textStyleWithDelta;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: textStyleWithDelta.fontSize,
      color: Theme.of(context).accentColor,
    );
  }
}
