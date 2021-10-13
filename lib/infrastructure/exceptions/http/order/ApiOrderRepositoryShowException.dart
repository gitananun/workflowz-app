import '../../../../presentation/extensions/string_extension.dart';

class ApiOrderRepositoryShowException implements Exception {
  String message;

  ApiOrderRepositoryShowException(this.message) {
    message = message.capitalize();
  }
}
