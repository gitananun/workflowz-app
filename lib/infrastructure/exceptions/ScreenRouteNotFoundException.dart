class ScreenRouteNotFoundException implements Exception {
  ScreenRouteNotFoundException(this.message);
  String message;

  @override
  String toString() => '$message route not found!';
}
