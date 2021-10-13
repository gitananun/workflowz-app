import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants/api.dart';
import '../../domain/data/models/Order.dart';
import '../../infrastructure/exceptions/http/orders/ApiOrdersInternalServerException.dart';
import '../../infrastructure/exceptions/http/orders/ApiOrdersRepositoryException.dart';
import '../../infrastructure/exceptions/http/orders/ApiOrdersRepositoryIndexException.dart';
import '../contracts/abstract_api_repository.dart';

class ApiOrdersRepository extends AbstractApiRepository {
  ///
  Future<List<Order>> index(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/getOrders'),
      headers: {'Authorization': getAuthorization(token)},
    );

    final dynamic responseBody = jsonDecode(response.body);

    if (response.statusCode == 200 && responseBody is Iterable<dynamic>) {
      return List<Order>.from(responseBody.map<Order>((dynamic model) => Order.fromJson(jsonEncode(model))));
    }

    if (response.statusCode == 555) throw ApiOrdersRepositoryIndexException(responseBody['message'].toString());
    if (response.statusCode == 500) throw ApiOrdersInternalServerException();

    throw ApiOrdersRepositoryException(responseBody);
  }
}
