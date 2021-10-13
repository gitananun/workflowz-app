import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:workflowz/domain/data/models/Location.dart';
import 'package:workflowz/domain/data/models/contracts/AbstractOrder.dart';

import '../../../infrastructure/exceptions/data/OrderModelDataException.dart';
import 'Employee.dart';
import 'OrderStatus.dart';

class Order extends AbstractOrder implements Equatable {
  final int id;
  final String customerName;
  final String productName;
  final Location location;
  final String kitchenNumber;
  final Employee worker;

  const Order({
    required this.id,
    required this.customerName,
    required this.productName,
    required this.location,
    required int startTimeMillis,
    required int finishTimeMillis,
    required this.kitchenNumber,
    required this.worker,
    required OrderStatus? orderStatus,
  }) : super(
          employee: worker,
          address: location,
          orderStatus: orderStatus,
          startTimeMillis: startTimeMillis,
          finishTimeMillis: finishTimeMillis,
        );

  Order copyWith({
    int? id,
    String? customerName,
    String? productName,
    Location? location,
    OrderStatus? orderStatus,
    int? startTimeMillis,
    int? finishTimeMillis,
    String? kitchenNumber,
    Employee? worker,
  }) {
    return Order(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      productName: productName ?? this.productName,
      location: location ?? this.location,
      orderStatus: orderStatus ?? this.orderStatus,
      startTimeMillis: startTimeMillis ?? this.startTimeMillis,
      finishTimeMillis: finishTimeMillis ?? this.finishTimeMillis,
      kitchenNumber: kitchenNumber ?? this.kitchenNumber,
      worker: worker ?? this.worker,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customerName': customerName,
      'productName': productName,
      'location': location.toMap(),
      'orderStatus': orderStatus?.toMap(),
      'startTimeMillis': startTimeMillis,
      'finishTimeMillis': finishTimeMillis,
      'kitchenNumber': kitchenNumber,
      'worker': worker.toMap(),
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    try {
      return Order(
        id: int.parse(map['id'].toString()),
        customerName: map['customerName'].toString(),
        productName: map['productName'].toString(),
        location: Location.fromMap(map['location'] as Map<String, dynamic>),
        orderStatus: OrderStatus.fromMap(map['orderStatus'] as Map<String, dynamic>),
        startTimeMillis: int.parse(map['startTimeMillis'].toString()),
        finishTimeMillis: int.parse(map['finishTimeMillis'].toString()),
        kitchenNumber: map['kitchenNumber'].toString(),
        worker: Employee.fromMap(map['worker'] as Map<String, dynamic>),
      );
    } catch (e) {
      throw OrderModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      customerName,
      productName,
      location,
      orderStatus!,
      startTimeMillis,
      finishTimeMillis,
      kitchenNumber,
      worker,
    ];
  }
}
