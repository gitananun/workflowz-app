import 'contracts/AbstractPrintableException.dart';

class UnexpectedException extends AbstractPrintableException implements Exception {
  final String message = 'Something went wrong!';
  final dynamic e;

  UnexpectedException(this.e) : super(e);
}
