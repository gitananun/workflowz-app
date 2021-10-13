import 'dart:convert';

import 'package:workflowz/constants/api.dart';
import 'package:workflowz/domain/data/models/Address.dart';
import 'package:workflowz/domain/data/models/SelfInfo.dart';
import 'package:http/http.dart' as http;
import 'package:workflowz/infrastructure/exceptions/http/profile/ApiProfileInternalServerException.dart';
import 'package:workflowz/infrastructure/exceptions/http/profile/ApiProfileRepositoryException.dart';
import 'package:workflowz/infrastructure/exceptions/http/profile/ApiProfileRepositoryUpdateException.dart';

import '../contracts/abstract_api_repository.dart';

class ApiProfileRepository extends AbstractApiRepository {
  ///
  Future<Address> update(String token, SelfInfo selfInfo) async {
    final Map<String, dynamic> body = <String, dynamic>{
      'firstName': selfInfo.firstName,
      'lastName': selfInfo.lastName,
      'email': selfInfo.email,
      'mobileNumber': selfInfo.mobileNumber,
      'profilePictBase64': selfInfo.profilePictBase64,
      'birthDateMillis': selfInfo.birthDateMillis,
      'address': {
        'postcode': selfInfo.address?.postcode,
        'street': selfInfo.address?.street,
        'houseNumber': selfInfo.address?.houseNumber,
        'flatNumber': selfInfo.address?.flatNumber,
        'city': selfInfo.address?.city,
        'country': selfInfo.address?.country,
        'region': selfInfo.address?.region,
      }
    };

    final response = await http.put(
      Uri.parse(updateSelfInfoUrl),
      body: jsonEncode(body),
      headers: {'Authorization': getAuthorization(token), 'Content-Type': 'application/json'},
    );

    final dynamic responseBody = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) return Address.fromJson(response.body);

    if (response.statusCode == 555) throw ApiProfileRepositoryUpdateException(responseBody['message'].toString());
    if (response.statusCode == 500) throw ApiProfileInternalServerException();

    throw ApiProfileRepositoryException(responseBody);
  }
}
