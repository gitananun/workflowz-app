import 'package:flutter/material.dart';

Future<DateTime?> showCustomDatePicker({
  required DateTime lastDate,
  required DateTime firstDate,
  required BuildContext context,
  required DateTime initialDate,
}) async {
  return showDatePicker(
    context: context,
    lastDate: lastDate,
    firstDate: firstDate,
    initialDate: initialDate,
    builder: (BuildContext context, Widget? child) {
      final ThemeData _themeData = Theme.of(context);
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light().copyWith(primary: _themeData.primaryColor),
        ),
        child: child ?? SizedBox(),
      );
    },
  );
}
