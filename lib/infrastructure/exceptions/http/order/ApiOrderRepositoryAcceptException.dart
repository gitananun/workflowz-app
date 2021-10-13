import '../../../../presentation/extensions/string_extension.dart';

class ApiOrderRepositoryAcceptException implements Exception {
  String message;

  ApiOrderRepositoryAcceptException(this.message) {
    message = message.capitalize();
  }
}
