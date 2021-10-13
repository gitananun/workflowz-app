import 'package:flutter/material.dart';

import 'package:workflowz/presentation/widgets/buttons/custom_circle_button_with_border.dart';
import 'package:workflowz/presentation/widgets/buttons/custom_circular_gradient_icon_button.dart';

import '../../../../Screens/dashboard/shared/dashboard_app_bar.dart';
import '../../../../widgets/buttons/custom_pop_screen_back_icon_button.dart';

class AssignmentScreenScaffold extends StatelessWidget {
  const AssignmentScreenScaffold({
    Key? key,
    this.onNext,
    this.nextIcon,
    required this.body,
    this.isAssignmentInfoPage = false,
  }) : super(key: key);
  final Widget body;
  final IconData? nextIcon;
  final bool isAssignmentInfoPage;
  final GestureTapCallback? onNext;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Scaffold(
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isAssignmentInfoPage
          ? null
          : Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCircleButtonWithBorder(
                    paddingValue: 20,
                    icon: Icons.arrow_back,
                    color: _themeData.primaryColor,
                    onPressed: () => Navigator.maybePop(context),
                  ),
                  IntrinsicHeight(
                    child: CustomCircularGradientIconButton(onTap: onNext, icon: nextIcon ?? Icons.arrow_forward),
                  ),
                ],
              ),
            ),
      appBar: DashboardAppBar(leading: CustomPopScreenBackIconButton()),
    );
  }
}
