/// Custom exception types for the app.
class AppException implements Exception {
  final String message;
  final int? statusCode;
  final AppExceptionType type;

  const AppException({
    required this.message,
    this.statusCode,
    this.type = AppExceptionType.unknown,
  });

  @override
  String toString() => 'AppException($type): $message';
}

enum AppExceptionType {
  network,
  auth,
  storage,
  validation,
  unknown,
}
