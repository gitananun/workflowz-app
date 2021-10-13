import 'package:flutter/material.dart';
import 'package:workflowz/presentation/screens/dashboard/notifications/components/notifications_item_footer_section.dart';

class NotificationsListViewItem extends StatelessWidget {
  const NotificationsListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: _themeData.textTheme.caption,
              children: <TextSpan>[
                TextSpan(text: 'Reminder:', style: _themeData.textTheme.caption?.apply(color: _themeData.primaryColor)),
                TextSpan(text: ' Order Today'),
              ],
            ),
          ),
          SizedBox(height: 10),
          NotificationsItemFooterSection(),
        ],
      ),
    );
  }
}
