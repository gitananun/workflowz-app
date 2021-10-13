import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../widgets/containers/custom_main_decorated_container.dart';

class PlanningListViewSingleItem extends StatelessWidget {
  const PlanningListViewSingleItem({
    Key? key,
    required this.date,
    required this.title,
    required this.address,
  }) : super(key: key);

  final String date;
  final String title;
  final String address;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    final TextStyle _textStyle = _themeData.textTheme.caption!;
    const double _wrapSpacing = 5;

    return CustomMainDecoratedContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _RowWrapper(
            icon: Icons.calendar_today,
            wrapSpacing: _wrapSpacing,
            textStyle: _textStyle,
            themeData: _themeData,
            text: date,
          ),
          Text(title, style: _textStyle),
          _RowWrapper(
            icon: FontAwesomeIcons.mapPin,
            wrapSpacing: _wrapSpacing,
            textStyle: _textStyle,
            themeData: _themeData,
            text: address,
          ),
        ],
      ),
    );
  }
}

class _RowWrapper extends StatelessWidget {
  const _RowWrapper({
    Key? key,
    required double wrapSpacing,
    required TextStyle textStyle,
    required ThemeData themeData,
    required this.icon,
    required this.text,
  })  : _wrapSpacing = wrapSpacing,
        _textStyle = textStyle,
        _themeData = themeData,
        super(key: key);

  final double _wrapSpacing;
  final TextStyle _textStyle;
  final ThemeData _themeData;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: _wrapSpacing,
      children: [
        Icon(icon, size: _textStyle.fontSize, color: _themeData.primaryColor),
        Text(text, style: _textStyle),
      ],
    );
  }
}
