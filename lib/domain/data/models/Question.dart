import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:workflowz/infrastructure/exceptions/data/QuestionModelDataException.dart';

class Question extends Equatable {
  final int id;
  final String type;
  final String label;
  final bool required;

  const Question({
    required this.id,
    required this.type,
    required this.label,
    required this.required,
  });

  Question copyWith({
    int? id,
    String? type,
    String? label,
    bool? required,
  }) {
    return Question(
      id: id ?? this.id,
      type: type ?? this.type,
      label: label ?? this.label,
      required: required ?? this.required,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'label': label,
      'required': required,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    try {
      return Question(
        id: int.parse(map['id'].toString()),
        type: map['type'].toString(),
        label: map['label'].toString(),
        required: map['required'] as bool,
      );
    } catch (e) {
      throw QuestionModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, type, label, required];
}
