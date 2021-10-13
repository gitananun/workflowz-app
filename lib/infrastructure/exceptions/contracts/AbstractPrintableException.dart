abstract class AbstractPrintableException implements Exception {
  final dynamic exception;

  AbstractPrintableException(this.exception) {
    print('${runtimeType.toString()}: ${exception.toString()}');
  }
}
