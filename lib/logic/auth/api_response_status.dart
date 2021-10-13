abstract class ApiResponseStatus {
  const ApiResponseStatus();
}

class ApiResponseInProgress extends ApiResponseStatus {}

class ApiResponseSuccess extends ApiResponseStatus {}

class ApiResponseFailure extends ApiResponseStatus {
  final dynamic exception;
  const ApiResponseFailure(this.exception);
}
