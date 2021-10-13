abstract class StringExtension {}

extension StringParsing on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';

  String parseSnakeCase() => replaceAll('_', ' ').toLowerCase().capitalize();
}
