import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:workflowz/domain/data/models/Address.dart';
import 'package:workflowz/infrastructure/exceptions/data/SelfInfoModelDataException.dart';

class SelfInfo extends Equatable {
  final String? firstName;
  final String? lastName;
  final String email;
  final String? mobileNumber;
  final String? profilePictBase64;
  final int? birthDateMillis;
  final Address? address;

  const SelfInfo({
    this.firstName,
    this.lastName,
    required this.email,
    this.mobileNumber,
    this.profilePictBase64,
    this.birthDateMillis,
    required this.address,
  });

  SelfInfo copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
    String? profilePictBase64,
    int? birthDateMillis,
    Address? address,
  }) {
    return SelfInfo(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      profilePictBase64: profilePictBase64 ?? this.profilePictBase64,
      birthDateMillis: birthDateMillis ?? this.birthDateMillis,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobileNumber': mobileNumber,
      'profilePictBase64': profilePictBase64,
      'birthDateMillis': birthDateMillis,
      'address': address?.toMap(),
    };
  }

  factory SelfInfo.fromMap(Map<String, dynamic> map) {
    try {
      return SelfInfo(
        firstName: map['firstName'].toString(),
        lastName: map['lastName'].toString(),
        email: map['email'].toString(),
        mobileNumber: map['mobileNumber'].toString(),
        profilePictBase64: map['profilePictBase64'].toString(),
        birthDateMillis: int.tryParse(map['birthDateMillis'].toString()),
        address: map['address'] != null ? Address.fromMap(map['address'] as Map<String, dynamic>) : null,
      );
    } catch (e) {
      throw SelfInfoModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory SelfInfo.fromJson(String source) => SelfInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      firstName.toString(),
      lastName.toString(),
      email,
      mobileNumber.toString(),
      profilePictBase64.toString(),
      birthDateMillis.toString(),
      address.toString(),
    ];
  }
}
