import 'package:flutter/material.dart';
import 'package:workflowz/presentation/screens/dashboard/notifications/components/notifications_app_bar.dart';
import 'package:workflowz/presentation/screens/dashboard/notifications/components/notifications_list_view_item.dart';
import 'package:workflowz/presentation/screens/shared/main_container.dart';
import 'package:workflowz/presentation/widgets/list_view/custom_list_view_separator.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 20),
      child: MainContainer(
        child: Column(
          children: [
            NotificationsScreenAppBar(),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (_, __) => CustomListViewSeparator(),
                itemBuilder: (BuildContext context, int i) => NotificationsListViewItem(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
