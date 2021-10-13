import 'dart:convert';

import '../../../infrastructure/exceptions/data/FailModelDataException.dart';

class Fail {
  final String code;
  final String message;
  final Map<String, dynamic>? params;

  const Fail({
    required this.code,
    required this.message,
    required this.params,
  });

  Fail copyWith({String? code, String? message, Map<String, dynamic>? params}) {
    return Fail(
      code: code ?? this.code,
      message: message ?? this.message,
      params: params ?? this.params,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'message': message,
      'params': params,
    };
  }

  factory Fail.fromMap(Map<String, dynamic> map) {
    try {
      return Fail(
        code: map['code'].toString(),
        message: map['message'].toString(),
        params: map['params'] != null ? Map<String, dynamic>.from(map['params'] as Map<String, dynamic>) : null,
      );
    } catch (e) {
      throw FailModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory Fail.fromJson(String source) => Fail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Fail(code: $code, message: $message, params: $params)';
}
