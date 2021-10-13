import 'package:flutter/material.dart';
import '../../../../styles/custom_spaces.dart';
import '../../../../widgets/buttons/custom_circle_button_with_border.dart';

class AssignmentItemFooterButtonsRow extends StatelessWidget {
  const AssignmentItemFooterButtonsRow({
    Key? key,
    required this.onAccept,
    required this.onDecline,
  }) : super(key: key);
  final VoidCallback? onDecline;
  final VoidCallback? onAccept;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Row(
      children: [
        CustomCircleButtonWithBorder(
          iconSize: _themeData.textTheme.bodyText2?.fontSize,
          icon: Icons.close,
          color: Colors.red,
          onPressed: onDecline,
        ),
        CustomSpaces.horizontalSpace,
        CustomCircleButtonWithBorder(
          iconSize: _themeData.textTheme.headline5?.fontSize,
          icon: Icons.check,
          color: Colors.green,
          onPressed: onAccept,
        ),
      ],
    );
  }
}
