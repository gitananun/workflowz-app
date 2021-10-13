import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../infrastructure/exceptions/data/AuthCredentialsModelDataException.dart';
import '../../valueObjects/BaseEmail.dart';

class AuthCredentials extends Equatable {
  final String token;
  final int userId;
  final BaseEmail email;

  const AuthCredentials({
    required this.token,
    required this.userId,
    required this.email,
  });

  Map<String, String> toMap() => {
        'token': token,
        'email': email.getValue(),
        'userId': userId.toString(),
      };

  factory AuthCredentials.fromMap(Map<String, dynamic> map) {
    try {
      return AuthCredentials(
        token: map['token'].toString(),
        email: BaseEmail(map['email'].toString()),
        userId: map['userId'] as int,
      );
    } catch (e) {
      throw AuthCredentialsModelDataException(e);
    }
  }

  String toJson() => json.encode(toMap());

  factory AuthCredentials.fromJson(String source) =>
      AuthCredentials.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthCredentials(token: $token, email: ${email.getValue()}, userId: $userId)';

  @override
  List<Object?> get props => [token, email, userId];
}
