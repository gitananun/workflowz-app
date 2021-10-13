import '../../../../presentation/extensions/string_extension.dart';

class ApiReportRepositoryAttachFileException implements Exception {
  String message;

  ApiReportRepositoryAttachFileException(this.message) {
    message = message.capitalize();
  }
}
