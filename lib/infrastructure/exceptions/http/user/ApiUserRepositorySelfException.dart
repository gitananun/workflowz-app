import '../../../../presentation/extensions/string_extension.dart';

class ApiUserRepositorySelfException implements Exception {
  String message;

  ApiUserRepositorySelfException(this.message) {
    message = message.capitalize();
  }
}
