import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ValueObjectInterface extends Equatable {
  dynamic getValue();

  @override
  String toString() => getValue().toString();

  @override
  bool? get stringify => false;
}
