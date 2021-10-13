import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:workflowz/logic/theme/bloc/theme_bloc.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return IntrinsicHeight(
          child: IntrinsicWidth(
            child: FlutterSwitch(
              inactiveColor: Colors.grey.shade300,
              activeColor: _themeData.primaryColor,
              value: state.themeMode == ThemeMode.dark,
              inactiveIcon: Icon(Icons.wb_sunny, color: _themeData.primaryColor),
              activeIcon: Icon(Icons.nightlight_round, color: _themeData.primaryColor),
              onToggle: (v) {
                HapticFeedback.mediumImpact();
                context.read<ThemeBloc>().add(ThemeSwitched(darkModeEnabled: v));
              },
            ),
          ),
        );
      },
    );
  }
}
