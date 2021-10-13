import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsScreenAppBar extends StatelessWidget {
  const NotificationsScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return AppBar(
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: Text('Notifications', style: _themeData.textTheme.caption),
      actions: [
        IconButton(
          onPressed: () => Navigator.maybePop(context),
          icon: FaIcon(FontAwesomeIcons.times, color: _themeData.textTheme.bodyText1?.color),
        ),
      ],
    );
  }
}
