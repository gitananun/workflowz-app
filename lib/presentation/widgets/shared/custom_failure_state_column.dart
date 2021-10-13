import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../styles/custom_spaces.dart';

class CustomFailureStateColumn extends StatelessWidget {
  const CustomFailureStateColumn({
    Key? key,
    required this.state,
    required this.exception,
  }) : super(key: key);
  final dynamic state;
  final dynamic exception;

  @override
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Something went wrong! \n$state \n$exception',
            style: _themeData.textTheme.caption,
            textAlign: TextAlign.center,
          ),
          CustomSpaces.verticalSpace,
          Icon(
            FontAwesomeIcons.timesCircle,
            color: _themeData.primaryColor,
            size: _themeData.textTheme.headline5?.fontSize,
          ),
        ],
      ),
    );
  }
}
