import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlanningScreenFloatingActionButton extends StatelessWidget {
  const PlanningScreenFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return FloatingActionButton(
      elevation: 0,
      backgroundColor: _themeData.primaryColor,
      onPressed: () => Navigator.pushNamed(context, '/availability'),
      child: Icon(FontAwesomeIcons.history, color: Colors.white),
    );
  }
}
