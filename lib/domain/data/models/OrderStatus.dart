import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:workflowz/domain/data/constants/enums/OrderActionEnums.dart';

import '../../../infrastructure/exceptions/data/OrderStatusModelDataException.dart';
import 'OrderAction.dart';

class OrderStatus extends Equatable {
  final String status;
  final String altName;
  final List<OrderAction>? actions;

  const OrderStatus({
    required this.status,
    required this.altName,
    required this.actions,
  });

  OrderStatus copyWith({
    String? status,
    String? altName,
    List<OrderAction>? actions,
  }) {
    return OrderStatus(
      status: status ?? this.status,
      altName: altName ?? this.altName,
      actions: actions ?? this.actions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'altName': altName,
      'movements': actions,
    };
  }

  factory OrderStatus.fromMap(Map<String, dynamic> map) {
    try {
      return OrderStatus(
        status: map['status'].toString(),
        altName: map['altName'].toString(),
        actions: map['actions'] != null
            ? List<OrderAction>.from(
                map['actions']?.map((dynamic x) => OrderAction.fromMap(x as Map<String, dynamic>)) as Iterable<dynamic>,
              )
            : null,
      );
    } catch (e) {
      throw OrderStatusModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory OrderStatus.fromJson(String source) => OrderStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [status, altName, actions ?? ''];

  bool? get isInitial => actions
      ?.where(
        (e) =>
            e.action == OrderActionEnums.ACCEPT.parseToString() || e.action == OrderActionEnums.DECLINE.parseToString(),
      )
      .isNotEmpty;
}
