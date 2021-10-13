import '../../constants/enums.dart';

class ValidationMessageNotFoundException implements Exception {
  ValidationMessageNotFoundException(this.type);
  ValidationType type;

  @override
  String toString() => "Message for $type doesn't exist!";
}
