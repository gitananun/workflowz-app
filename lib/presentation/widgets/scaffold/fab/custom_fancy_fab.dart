import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workflowz/presentation/theme/mts_theme.dart';

import 'components/custom_fancy_fab_rect_item.dart';
import 'components/custom_fancy_fab_toggle.dart';

class CustomFancyFab extends StatefulWidget {
  const CustomFancyFab({
    Key? key,
    this.icon,
    this.tooltip,
    required this.onPressed,
  }) : super(key: key);

  final Function() onPressed;
  final String? tooltip;
  final IconData? icon;

  @override
  _CustomFancyFabState createState() => _CustomFancyFabState();
}

class _CustomFancyFabState extends State<CustomFancyFab> with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<Color?> _buttonColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButtons;
  final Curve _curve = Curves.easeOut;
  final double _fabWidth = 400;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300))
      ..addListener(() => setState(() {}));

    _animateIcon = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _buttonColor = ColorTween(begin: MTStheme.getPrimaryColor, end: MTStheme.getPrimaryColor).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 1),
      ),
    );

    _translateButtons = Tween<double>(begin: _fabWidth, end: 10).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.75, curve: _curve),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget list() => CustomFancyFabRectItem(label: 'List View', icon: Icons.list);

  Widget week() => CustomFancyFabRectItem(label: 'Week View', icon: FontAwesomeIcons.calendarAlt);

  Widget month() => CustomFancyFabRectItem(label: 'Month View', icon: Icons.calendar_today_outlined);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(_translateButtons.value * 1, 0, 0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: _themeData.cardColor),
            child: Row(children: [list(), week(), month()]),
          ),
        ),
        CustomFancyFabToggle(
          icon: AnimatedIcons.menu_arrow,
          progress: _animateIcon,
          onPressed: animate,
          backgroundColor: _buttonColor.value,
        ),
      ],
    );
  }
}
