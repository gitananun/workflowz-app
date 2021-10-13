import 'dart:convert';

import 'package:equatable/equatable.dart';
import '../../../infrastructure/exceptions/data/PermissionModelDataException.dart';

class Permission extends Equatable {
  final int id;
  final String title;

  const Permission({required this.id, required this.title});

  Permission copyWith({int? id, String? title}) => Permission(id: id ?? this.id, title: title ?? this.title);

  Map<String, dynamic> toMap() => <String, dynamic>{'id': id, 'title': title};

  factory Permission.fromMap(Map<String, dynamic> map) {
    try {
      return Permission(
        id: int.parse(map['id'].toString()),
        title: map['title'].toString(),
      );
    } catch (e) {
      throw PermissionModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory Permission.fromJson(String source) => Permission.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, title];
}
