import '../../../../presentation/extensions/string_extension.dart';

class ApiAuthRepositoryLoginException implements Exception {
  String message;

  ApiAuthRepositoryLoginException(this.message) {
    message = message.capitalize();
  }
}
