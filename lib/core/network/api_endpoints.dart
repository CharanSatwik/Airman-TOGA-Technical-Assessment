/// Mock API endpoints. Will point to real backend when available.
class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.airman.toga/v1';

  // Auth
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';

  // Dashboard
  static const String dashboard = '/dashboard';

  // Study
  static const String subjects = '/study/subjects';
  static String chapters(String subjectId) => '/study/subjects/$subjectId/chapters';

  // Notes
  static const String notes = '/notes';
  static String syncNote(String noteId) => '/notes/$noteId/sync';

  // Logbook
  static const String logbook = '/logbook';
  static const String logbookSummary = '/logbook/summary';

  // Notifications
  static const String notifications = '/notifications';
  static String markAsRead(String id) => '/notifications/$id/read';
}
