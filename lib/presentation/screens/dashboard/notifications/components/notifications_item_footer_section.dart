import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationsItemFooterSection extends StatelessWidget {
  const NotificationsItemFooterSection({Key? key}) : super(key: key);
  final double _commonSpacing = 5;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextStyle _textStyleWithDelta = _themeData.textTheme.caption!.apply(fontSizeDelta: -4);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          spacing: _commonSpacing,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _NotificationItemFooterIcon(FontAwesomeIcons.clock, _textStyleWithDelta),
            Text('13:00 ', style: _textStyleWithDelta),
            SizedBox(width: 3),
            _NotificationItemFooterIcon(FontAwesomeIcons.mapMarkerAlt, _textStyleWithDelta),
            Text('Region ', style: _textStyleWithDelta),
          ],
        ),
        Text(
          'View',
          style: _textStyleWithDelta.apply(
            color: _themeData.primaryColor,
            decoration: TextDecoration.underline,
          ),
        )
      ],
    );
  }
}

class _NotificationItemFooterIcon extends StatelessWidget {
  const _NotificationItemFooterIcon(this.icon, this.textStyleWithDelta, {Key? key}) : super(key: key);

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
