/// Utility functions for deriving status from progress values.
class StatusUtils {
  StatusUtils._();

  /// Returns a human-readable status string from a progress percentage (0–100).
  ///
  /// - 0 → "Not Started"
  /// - 1–99 → "In Progress"
  /// - 100 → "Completed"
  /// - Out of range → throws [ArgumentError]
  static String getStatus(int progress) {
    if (progress < 0 || progress > 100) {
      throw ArgumentError('Progress must be between 0 and 100, got $progress');
    }
    if (progress == 0) return 'Not Started';
    if (progress == 100) return 'Completed';
    return 'In Progress';
  }
}
