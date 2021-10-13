import '../../../../presentation/extensions/string_extension.dart';

class ApiOrderRepositorySaveException implements Exception {
  String message;

  ApiOrderRepositorySaveException(this.message) {
    message = message.capitalize();
  }
}
