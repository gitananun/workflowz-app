import '../../../../presentation/extensions/string_extension.dart';

class ApiOrdersRepositoryIndexException implements Exception {
  String message;

  ApiOrdersRepositoryIndexException(this.message) {
    message = message.capitalize();
  }
}
