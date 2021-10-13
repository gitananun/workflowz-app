import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:workflowz/domain/data/models/Question.dart';
import 'package:workflowz/infrastructure/exceptions/http/order/ApiOrderInternalServerException.dart';
import 'package:workflowz/infrastructure/exceptions/http/order/ApiOrderRepositoryFetchQuestionsException.dart';

import '../../constants/api.dart';
import '../../domain/data/models/OrderFull.dart';
import '../../infrastructure/exceptions/http/order/ApiOrderRepositoryException.dart';
import '../../infrastructure/exceptions/http/order/ApiOrderRepositoryShowException.dart';
import '../contracts/abstract_api_repository.dart';

class ApiOrderRepository extends AbstractApiRepository {
  ///
  Future<OrderFull> show(String token, int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/getOrder/$id'),
      headers: {'Authorization': getAuthorization(token)},
    );
    final dynamic responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) return OrderFull.fromJson(response.body);

    if (response.statusCode == 555) throw ApiOrderRepositoryShowException(responseBody['message'].toString());
    if (response.statusCode == 500) throw ApiOrderInternalServerException();

    throw ApiOrderRepositoryException(responseBody);
  }

  Future<List<Question>?> fetchQuestions(String token, int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/getOrderReport/$id'),
      headers: {'Authorization': getAuthorization(token)},
    );

    final dynamic responseBody = jsonDecode(response.body);

    final dynamic rawQuestions = responseBody['questions'];
    if (response.statusCode == 200 && rawQuestions is Iterable<dynamic>) {
      return List<Question>.from(rawQuestions.map<Question>((dynamic model) => Question.fromJson(jsonEncode(model))));
    }

    if (response.statusCode == 555) throw ApiOrderRepositoryFetchQuestionsException(responseBody['message'].toString());
    if (response.statusCode == 500) throw ApiOrderInternalServerException();

    throw ApiOrderRepositoryException(responseBody);
  }
}
