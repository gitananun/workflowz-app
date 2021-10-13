import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../../../infrastructure/exceptions/data/CustomerModelDataException.dart';

class Customer extends Equatable {
  final int id;
  final String name;
  final String phoneNumber;
  final String email;

  const Customer({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  Customer copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? email,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  factory Customer.fromMap(dynamic map) {
    try {
      return map != null
          ? Customer(
              id: int.parse(map['id'].toString()),
              name: map['name'].toString(),
              phoneNumber: map['phoneNumber'].toString(),
              email: map['email'].toString(),
            )
          : Customer(id: -1, name: '', phoneNumber: '', email: '');
    } catch (e) {
      throw CustomerModelDataException(e);
    }
  }

  bool get isNull => id < 0;

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, phoneNumber, email];
}
