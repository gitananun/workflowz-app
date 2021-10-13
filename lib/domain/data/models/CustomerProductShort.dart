import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../../../infrastructure/exceptions/data/CustomerProductShortModelDataException.dart';

class CustomerProductShort extends Equatable {
  final int id;
  final String name;
  final String description;

  const CustomerProductShort({
    required this.id,
    required this.name,
    required this.description,
  });

  CustomerProductShort copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return CustomerProductShort(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory CustomerProductShort.fromMap(Map<String, dynamic> map) {
    try {
      return CustomerProductShort(
        id: int.parse(map['id'].toString()),
        name: map['name'].toString(),
        description: map['description'].toString(),
      );
    } catch (e) {
      throw CustomerProductShortModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory CustomerProductShort.fromJson(String source) =>
      CustomerProductShort.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, description];
}
