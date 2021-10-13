import '../../../../presentation/extensions/string_extension.dart';

class ApiReportRepositoryActException implements Exception {
  String message;

  ApiReportRepositoryActException(this.message) {
    message = message.capitalize();
  }
}
