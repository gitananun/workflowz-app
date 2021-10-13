import 'package:workflowz/presentation/extensions/string_extension.dart';

class ApiProfileRepositoryUpdateException implements Exception {
  String message;

  ApiProfileRepositoryUpdateException(this.message) {
    message = message.capitalize();
  }
}
