import '../../../../presentation/extensions/string_extension.dart';

class ApiReportRepositorySaveException implements Exception {
  String message;

  ApiReportRepositorySaveException(this.message) {
    message = message.capitalize();
  }
}
