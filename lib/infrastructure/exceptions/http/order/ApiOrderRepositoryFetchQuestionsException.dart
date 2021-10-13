import '../../../../presentation/extensions/string_extension.dart';

class ApiOrderRepositoryFetchQuestionsException implements Exception {
  String message;

  ApiOrderRepositoryFetchQuestionsException(this.message) {
    message = message.capitalize();
  }
}
