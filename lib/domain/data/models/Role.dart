import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../infrastructure/exceptions/data/RoleModelDataException.dart';
import 'Permission.dart';

class Role extends Equatable {
  final String id;
  final String title;
  final List<Permission>? permissions;

  const Role({
    required this.id,
    required this.title,
    this.permissions,
  });

  Role copyWith({
    String? id,
    String? title,
    List<Permission>? permissions,
  }) {
    return Role(
      id: id ?? this.id,
      title: title ?? this.title,
      permissions: permissions ?? this.permissions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'permissions': permissions?.map((x) => x.toMap()).toList(),
    };
  }

  factory Role.fromMap(Map<String, dynamic> map) {
    try {
      return Role(
        id: map['id'].toString(),
        title: map['title'].toString(),
        permissions: List<Permission>.from(
          map['permissions']?.map((dynamic x) => Permission.fromMap(x as Map<String, dynamic>)) as Iterable<dynamic>,
        ),
      );
    } catch (e) {
      throw RoleModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory Role.fromJson(String source) => Role.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title];
}
