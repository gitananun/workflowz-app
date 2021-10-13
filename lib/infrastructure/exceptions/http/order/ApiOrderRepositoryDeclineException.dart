import '../../../../presentation/extensions/string_extension.dart';

class ApiOrderRepositoryDeclineException implements Exception {
  String message;

  ApiOrderRepositoryDeclineException(this.message) {
    message = message.capitalize();
  }
}
