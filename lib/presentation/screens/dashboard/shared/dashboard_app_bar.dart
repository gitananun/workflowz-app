import 'package:flutter/material.dart';
import 'package:workflowz/presentation/screens/dashboard/notifications/notifications.dart';

import '../../../widgets/logo.dart';
import '../home/components/home_actions.dart';
import 'dashboard_app_bar_search_leading.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({Key? key, this.leading}) : super(key: key);
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  void _onNotifications(BuildContext context) {
    showModalBottomSheet<Widget>(
      context: context,
      isScrollControlled: true,
      builder: (context) => NotificationsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: SizedBox(width: 80, child: Logo()),
      leading: leading ?? DashboardAppBarSearchLeading(),
      actionsIconTheme: IconThemeData(size: 25, color: _themeData.accentColor),
      actions: [
        HomeActions(onNotifications: () => _onNotifications(context)),
      ],
    );
  }
}
