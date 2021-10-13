import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/data/models/AuthCredentials.dart';
import '../../domain/data/models/User.dart';
import '../../domain/valueObjects/BaseEmail.dart';
import '../../domain/valueObjects/BasePassword.dart';
import '../../infrastructure/exceptions/http/auth/ApiAuthInternalServerException.dart';
import '../../infrastructure/exceptions/http/auth/ApiAuthRepositoryException.dart';
import '../../infrastructure/exceptions/http/auth/ApiAuthRepositoryLoginException.dart';
import '../contracts/abstract_api_repository.dart';

class ApiAuthRepository extends AbstractApiRepository {
  Future<AuthCredentials> login({
    required BaseEmail email,
    required BasePassword password,
  }) async {
    final Map<String, String> data = {'login': email.getValue(), 'password': password.getValue()};

    final response = await http.post(Uri.parse('$baseUrl/login'), body: data);

    final dynamic responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) return AuthCredentials.fromJson(response.body);
    if (response.statusCode == 555) throw ApiAuthRepositoryLoginException(responseBody['message'].toString());
    if (response.statusCode == 500) throw ApiAuthInternalServerException();

    throw ApiAuthRepositoryException(responseBody);
  }

  Future<User> signup({
    required BaseEmail email,
    required BasePassword password,
    required BasePassword confirmPassword,
  }) async {
    final response = await http.post(Uri.parse('$baseUrl/login'));

    if (response.statusCode == 200) return User.fromJson(response.body);
    if (response.statusCode == 500) throw ApiAuthInternalServerException();

    throw ApiAuthRepositoryException(response.body);
  }
}
