import '../../../../presentation/extensions/string_extension.dart';

class ApiOrderRepositoryActException implements Exception {
  String message;

  ApiOrderRepositoryActException(this.message) {
    message = message.capitalize();
  }
}
