import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as http_parser;
import 'package:path/path.dart' as path;
import 'package:workflowz/domain/data/constants/enums/OrderActionEnums.dart';
import 'package:workflowz/domain/data/models/FullReport.dart';
import 'package:workflowz/infrastructure/exceptions/http/order/ApiOrderRepositoryActException.dart';
import 'package:workflowz/infrastructure/exceptions/http/report/ApiReportRepositoryAttachFileException.dart';
import 'package:workflowz/infrastructure/exceptions/http/report/ApiReportRepositoryException.dart';
import 'package:workflowz/infrastructure/exceptions/http/report/ApiReportRepositorySaveException.dart';
import 'package:workflowz/logic/auth/api_response_status.dart';

import '../../constants/api.dart';
import '../../domain/data/models/OrderFull.dart';
import '../../infrastructure/exceptions/http/report/ApiReportInternalServerException.dart';
import '../contracts/abstract_api_repository.dart';

class ApiReportRepository extends AbstractApiRepository {
  ///
  Future<OrderFull> act(String token, int id, OrderActionEnums action) async {
    final String url = getActUrl(id, action);

    final response = await http.put(Uri.parse(url), headers: {'Authorization': getAuthorization(token)});

    final dynamic responseBody = jsonDecode(response.body);

    if (response.statusCode == 200) return OrderFull.fromJson(response.body);

    if (response.statusCode == 555) throw ApiOrderRepositoryActException(responseBody['message'].toString());
    if (response.statusCode == 500) throw ApiReportInternalServerException();

    throw ApiReportRepositoryException(responseBody);
  }

  ///
  Future<ApiResponseSuccess> attachFile(String token, int id, File file) async {
    final dio = Dio();

    final formData = FormData.fromMap(
      <String, dynamic>{
        'description': 'Order attach file',
        'orderId': id,
        'fileName': path.basenameWithoutExtension(file.path),
        'file': await MultipartFile.fromFile(
          file.path,
          filename: path.basenameWithoutExtension(file.path),
        ),
      },
    );

    final response = await dio.post<dynamic>(
      attachFileUrl,
      data: formData,
      options: Options(
        headers: <String, dynamic>{
          'Authorization': getAuthorization(token),
        },
      ),
    );

    final dynamic responseBody = json.decode(json.encode(response.data).toString());

    if (response.statusCode == 200) return ApiResponseSuccess();

    if (response.statusCode == 555) throw ApiReportRepositoryAttachFileException(responseBody['message'].toString());
    if (response.statusCode == 500) throw ApiReportInternalServerException();

    throw ApiReportRepositoryException(responseBody);
  }

  ///
  ///
  Future<void> save(String token, int id, FullReport fullReport, List<String> attachedFileLinks) async {
    final List<Map<String, dynamic>> fields = [];

    fullReport.questions?.forEach((key, value) => fields.add(<String, dynamic>{'fieldId': key, 'fieldValue': value}));

    final http.MultipartRequest request = http.MultipartRequest('POST', saveReportUrl)
      ..headers['Authorization'] = getAuthorization(token)
      ..fields['orderId'] = id.toString()
      ..fields['monteurName'] = fullReport.monteurName.toString()
      ..fields['clientName'] = fullReport.clientName.toString()
      ..fields['remarks'] = fullReport.remarks.toString()
      ..fields['kitchenNumber'] = fullReport.kitchenNumber.toString()
      ..files.add(
        http.MultipartFile.fromString(
          'comments',
          jsonEncode(fullReport.comments),
          contentType: http_parser.MediaType('application', 'json'),
        ),
      )
      ..files.add(
        http.MultipartFile.fromString(
          'damagedItems',
          jsonEncode([fullReport.damagedItems]),
          contentType: http_parser.MediaType('application', 'json'),
        ),
      )
      ..files.add(
        http.MultipartFile.fromString(
          'fields',
          jsonEncode(fields),
          contentType: http_parser.MediaType('application', 'json'),
        ),
      );

    if (fullReport.signature != null) {
      request.files.add(
        http.MultipartFile.fromBytes(
          'signature',
          fullReport.signature!.toList(),
          filename: 'signature.png',
          contentType: http_parser.MediaType('application', 'octet-stream'),
        ),
      );
    }

    if (fullReport.clientSignature != null)
      request.files.add(
        http.MultipartFile.fromBytes(
          'clientSignature',
          fullReport.clientSignature!.toList(),
          filename: 'client_signature.png',
          contentType: http_parser.MediaType('application', 'octet-stream'),
        ),
      );

    final responseStream = await request.send();
    final response = await http.Response.fromStream(responseStream);

    if (response.statusCode >= 200 && response.statusCode < 300) return;

    if (response.statusCode == 500) throw ApiReportInternalServerException();
    if (response.statusCode != 200) throw ApiReportRepositorySaveException('report submission failed');

    throw ApiReportRepositoryException('report save failed');
  }
}
