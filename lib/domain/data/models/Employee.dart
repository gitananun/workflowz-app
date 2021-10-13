import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../infrastructure/exceptions/data/EmployeeModelDataException.dart';
import 'Availability.dart';
import 'Location.dart';

class Employee extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final Location? location;
  final List<Availability>? availability;
  final bool? available;

  const Employee({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.location,
    required this.availability,
    required this.available,
  });

  Employee copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? mobileNumber,
    Location? location,
    List<Availability>? availability,
    bool? available,
  }) {
    return Employee(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      location: location ?? this.location,
      availability: availability ?? this.availability,
      available: available ?? this.available,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
      'location': location!.toMap(),
      'availability': availability!.map((x) => x.toMap()).toList(),
      'available': available,
    };
  }

  factory Employee.fromMap(Map<String, dynamic> map) {
    try {
      return Employee(
        id: int.parse(map['id'].toString()),
        firstName: map['firstName'].toString(),
        lastName: map['lastName'].toString(),
        mobileNumber: map['mobileNumber'].toString(),
        location: map['location'] != null ? Location.fromMap(map['location'] as Map<String, dynamic>) : null,
        availability: map['availability'] != null
            ? List<Availability>.from(
                map['availability']?.map((dynamic x) => Availability.fromMap(x as Map<String, dynamic>))
                    as Iterable<dynamic>,
              )
            : null,
        available: map['available'] != null ? map['available'] as bool : null,
      );
    } catch (e) {
      throw EmployeeModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory Employee.fromJson(String source) => Employee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, firstName, lastName, mobileNumber];
}
