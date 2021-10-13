import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../constants/api.dart';
import '../../domain/data/models/User.dart';
import '../../infrastructure/exceptions/http/user/ApiUserInternalServerException.dart';
import '../../infrastructure/exceptions/http/user/ApiUserRepositoryException.dart';
import '../../infrastructure/exceptions/http/user/ApiUserRepositorySelfException.dart';
import '../contracts/abstract_api_repository.dart';

class ApiUserRepository extends AbstractApiRepository {
  Future<User> self(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/selfInfo'),
      headers: {'Authorization': getAuthorization(token)},
    );

    final dynamic responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) return User.fromJson(response.body);
    if (response.statusCode == 555) throw ApiUserRepositorySelfException(responseBody['message'].toString());
    if (response.statusCode == 500) throw ApiUserInternalServerException();

    throw ApiUserRepositoryException(responseBody);
  }
}
