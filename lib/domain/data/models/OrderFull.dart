import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:workflowz/domain/data/models/contracts/AbstractOrder.dart';

import '../../../infrastructure/exceptions/data/OrderFullModelDataException.dart';
import 'Customer.dart';
import 'CustomerProductShort.dart';
import 'Employee.dart';
import 'Location.dart';
import 'OrderStatus.dart';

class OrderFull extends AbstractOrder implements Equatable {
  final int id;
  final Customer? customer;
  final Location? location;
  final CustomerProductShort? product;
  final bool? startByDateOnly;
  final String kitchenNumber;
  final Employee? worker;
  final Employee? contact;
  final String tot;
  final String instructions;
  final bool? smsArrival;
  final bool? smsReminder;
  final num? price;

  OrderFull({
    required this.id,
    required this.customer,
    required this.location,
    required this.product,
    this.startByDateOnly,
    required int startTimeMillis,
    required int finishTimeMillis,
    required this.kitchenNumber,
    required this.worker,
    required this.contact,
    required this.tot,
    required this.instructions,
    this.smsArrival,
    this.smsReminder,
    this.price,
    required OrderStatus? orderStatus,
  }) : super(
          employee: worker,
          address: location,
          orderStatus: orderStatus,
          startTimeMillis: startTimeMillis,
          finishTimeMillis: finishTimeMillis,
        );

  OrderFull copyWith({
    int? id,
    Customer? customer,
    Location? location,
    CustomerProductShort? product,
    OrderStatus? status,
    bool? startByDateOnly,
    int? startTimeMillis,
    int? finishTimeMillis,
    String? kitchenNumber,
    Employee? worker,
    Employee? contact,
    String? tot,
    String? instructions,
    bool? smsArrival,
    bool? smsReminder,
    num? price,
  }) {
    return OrderFull(
      id: id ?? this.id,
      customer: customer ?? this.customer,
      location: location ?? this.location,
      product: product ?? this.product,
      orderStatus: orderStatus ?? orderStatus,
      startByDateOnly: startByDateOnly ?? this.startByDateOnly,
      startTimeMillis: startTimeMillis ?? this.startTimeMillis,
      finishTimeMillis: finishTimeMillis ?? this.finishTimeMillis,
      kitchenNumber: kitchenNumber ?? this.kitchenNumber,
      worker: worker ?? this.worker,
      contact: contact ?? this.contact,
      tot: tot ?? this.tot,
      instructions: instructions ?? this.instructions,
      smsArrival: smsArrival ?? this.smsArrival,
      smsReminder: smsReminder ?? this.smsReminder,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customer': customer!.toMap(),
      'location': location!.toMap(),
      'product': product!.toMap(),
      'status': orderStatus!.toMap(),
      'startByDateOnly': startByDateOnly,
      'startTimeMillis': startTimeMillis,
      'finishTimeMillis': finishTimeMillis,
      'kitchenNumber': kitchenNumber,
      'worker': worker!.toMap(),
      'contact': contact!.toMap(),
      'tot': tot,
      'instructions': instructions,
      'smsArrival': smsArrival,
      'smsReminder': smsReminder,
      'price': price,
    };
  }

  factory OrderFull.fromMap(Map<String, dynamic> map) {
    try {
      return OrderFull(
        id: int.parse(map['id'].toString()),
        customer: Customer.fromMap(map['customer']),
        location: map['location'] != null ? Location.fromMap(map['location'] as Map<String, dynamic>) : null,
        product: map['product'] != null ? CustomerProductShort.fromMap(map['product'] as Map<String, dynamic>) : null,
        orderStatus:
            map['orderStatus'] != null ? OrderStatus.fromMap(map['orderStatus'] as Map<String, dynamic>) : null,
        startByDateOnly: map['startByDateOnly'] != null ? map['startByDateOnly'] as bool : null,
        startTimeMillis: int.parse(map['startTimeMillis'].toString()),
        finishTimeMillis: int.parse(map['finishTimeMillis'].toString()),
        kitchenNumber: map['kitchenNumber'].toString(),
        worker: map['worker'] != null ? Employee.fromMap(map['worker'] as Map<String, dynamic>) : null,
        contact: map['contact'] != null ? Employee.fromMap(map['contact'] as Map<String, dynamic>) : null,
        tot: map['tot'].toString(),
        instructions: map['instructions'].toString(),
        smsArrival: map['smsArrival'] != null ? map['smsArrival'] as bool : null,
        smsReminder: map['smsReminder'] != null ? map['smsReminder'] as bool : null,
        price: num.tryParse(map['price'].toString()),
      );
    } catch (e) {
      throw OrderFullModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory OrderFull.fromJson(String source) => OrderFull.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        id,
        startTimeMillis,
        finishTimeMillis,
        kitchenNumber,
        tot,
        instructions,
        orderStatus!.status,
      ];
}
