import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../../../infrastructure/exceptions/data/LocationModelDataException.dart';

class Location extends Equatable {
  final int id;
  final String postcode;
  final String street;
  final String city;
  final String houseNumber;
  final String? addition;
  final String? flatNumber;
  final String? country;
  final String? firstName;
  final String? insertion;
  final String lastName;
  final String? phoneNumber;
  final String? email;

  const Location({
    required this.id,
    required this.postcode,
    required this.street,
    required this.city,
    required this.houseNumber,
    required this.addition,
    required this.flatNumber,
    required this.country,
    required this.firstName,
    required this.insertion,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  Location copyWith({
    int? id,
    String? postcode,
    String? street,
    String? city,
    String? houseNumber,
    String? addition,
    String? flatNumber,
    String? country,
    String? firstName,
    String? insertion,
    String? lastName,
    String? phoneNumber,
    String? email,
  }) {
    return Location(
      id: id ?? this.id,
      postcode: postcode ?? this.postcode,
      street: street ?? this.street,
      city: city ?? this.city,
      houseNumber: houseNumber ?? this.houseNumber,
      addition: addition ?? this.addition,
      flatNumber: flatNumber ?? this.flatNumber,
      country: country ?? this.country,
      firstName: firstName ?? this.firstName,
      insertion: insertion ?? this.insertion,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'postcode': postcode,
      'street': street,
      'city': city,
      'houseNumber': houseNumber,
      'addition': addition,
      'flatNumber': flatNumber,
      'country': country,
      'firstName': firstName,
      'insertion': insertion,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    try {
      return Location(
        id: int.parse(map['id'].toString()),
        postcode: map['postcode'].toString(),
        street: map['street'].toString(),
        city: map['city'].toString(),
        houseNumber: map['houseNumber'].toString(),
        addition: map['addition'].toString(),
        flatNumber: map['flatNumber'].toString(),
        country: map['country'].toString(),
        firstName: map['firstName'].toString(),
        insertion: map['insertion'].toString(),
        lastName: map['lastName'].toString(),
        phoneNumber: map['phoneNumber'].toString(),
        email: map['email'].toString(),
      );
    } catch (e) {
      throw LocationModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [postcode, street, city, houseNumber, lastName];
}
