import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:workflowz/domain/data/models/Address.dart';

import '../../../infrastructure/exceptions/data/UserModelDataException.dart';
import 'Customer.dart';
import 'Role.dart';

class User extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String description;
  final String registrationDate;
  final List<Role>? roles;
  final String mobileNumber;
  final Customer? customer;
  final bool active;
  final Address? address;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.description,
    required this.registrationDate,
    required this.roles,
    required this.mobileNumber,
    required this.customer,
    required this.active,
    required this.address,
  });

  User copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? description,
    String? registrationDate,
    List<Role>? roles,
    String? mobileNumber,
    Customer? customer,
    bool? active,
    Address? address,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      description: description ?? this.description,
      registrationDate: registrationDate ?? this.registrationDate,
      roles: roles ?? this.roles,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      customer: customer ?? this.customer,
      active: active ?? this.active,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'description': description,
      'registrationDate': registrationDate,
      'roles': roles!.map((x) => x.toMap()).toList(),
      'mobileNumber': mobileNumber,
      'customer': customer!.toMap(),
      'active': active,
      'address': address?.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    try {
      return User(
        firstName: map['firstName'].toString(),
        lastName: map['lastName'].toString(),
        email: map['email'].toString(),
        description: map['description'].toString(),
        registrationDate: map['registrationDate'].toString(),
        roles: List<Role>.from(
          map['roles'].map((dynamic x) => Role.fromMap(x as Map<String, dynamic>)) as Iterable<dynamic>,
        ),
        mobileNumber: map['mobileNumber'].toString(),
        customer: Customer.fromMap(map['customerShortDTO']),
        active: map['active'] as bool,
        address: map['userAddress'] != null ? Address.fromMap(map['userAddress'] as Map<String, dynamic>) : null,
      );
    } catch (e) {
      throw UserModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) {
    return User.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        description,
        registrationDate,
        mobileNumber,
        active,
      ];

  String get getFullName => '${firstName.toString()} ${lastName.toString()}';
}
