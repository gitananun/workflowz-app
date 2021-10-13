import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class DateTimeExtension {}

extension DateTimeParsing on DateTime {
  static final DateFormat _dateFormatter = DateFormat('dd.MM.yyyy');
  static final DateFormat _timeFormatter = DateFormat('H:m');

  String get getDate => _dateFormatter.format(this);

  String get getTime => _timeFormatter.format(this);
}

extension TimeParsing on TimeOfDay {
  String get getPeriod => period.toString().split('.').last.toUpperCase();
}
