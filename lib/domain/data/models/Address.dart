import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:workflowz/infrastructure/exceptions/data/AddressModelDataException.dart';

class Address extends Equatable {
  final String? postcode;
  final String? street;
  final String? houseNumber;
  final String? flatNumber;
  final String? city;
  final String? country;
  final String? region;

  const Address({
    this.postcode,
    this.street,
    this.houseNumber,
    this.flatNumber,
    this.city,
    this.country,
    this.region,
  });

  Address copyWith({
    String? postcode,
    String? street,
    String? houseNumber,
    String? flatNumber,
    String? city,
    String? country,
    String? region,
  }) {
    return Address(
      postcode: postcode ?? this.postcode,
      street: street ?? this.street,
      houseNumber: houseNumber ?? this.houseNumber,
      flatNumber: flatNumber ?? this.flatNumber,
      city: city ?? this.city,
      country: country ?? this.country,
      region: region ?? this.region,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postcode': postcode,
      'street': street,
      'houseNumber': houseNumber,
      'flatNumber': flatNumber,
      'city': city,
      'country': country,
      'region': region,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    try {
      return Address(
        postcode: map['postcode'].toString(),
        street: map['street'].toString(),
        houseNumber: map['houseNumber'].toString(),
        flatNumber: map['flatNumber'].toString(),
        city: map['city'].toString(),
        country: map['country'].toString(),
        region: map['region'].toString(),
      );
    } catch (e) {
      throw AddressModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      postcode ?? '',
      street ?? '',
      houseNumber ?? '',
      flatNumber ?? '',
      city ?? '',
      country ?? '',
      region ?? '',
    ];
  }
}
