import '../../constants/enums.dart';

class RegexNotFoundException implements Exception {
  RegexNotFoundException(this.type);
  ValidationType type;

  @override
  String toString() => "Regex Expression for $type doesn't exist!";
}
