import '../../../core/network/api_response.dart';
import '../../../core/storage/hive_storage.dart';
import 'package:airman_toga/features/notifications/data/models/notification_item.dart';

/// Notification service with mock data and Hive persistence.
class NotificationService {
  final HiveStorage _storage = HiveStorage.instance;

  /// Returns 5 mock notifications after 500ms delay.
  Future<ApiResponse<List<NotificationItem>>> getNotifications() async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Check Hive for persisted read state
    final storedNotifications = _storage.getAll(_storage.notificationsBox);
    final readIds = <String>{};
    for (final json in storedNotifications) {
      if (json['isRead'] == true) {
        readIds.add(json['id'] as String);
      }
    }

    final notifications = [
      NotificationItem(
        id: 'notif_01',
        title: 'Flight Scheduled',
        message: 'Cross-Country Navigation on May 30 at 06:30 AM.',
        type: 'flight',
        time: '2h ago',
        isRead: readIds.contains('notif_01'),
      ),
      NotificationItem(
        id: 'notif_02',
        title: 'Quiz Available',
        message: 'Navigation chapter quiz is now available.',
        type: 'study',
        time: '5h ago',
        isRead: readIds.contains('notif_02'),
      ),
      NotificationItem(
        id: 'notif_03',
        title: 'Schedule Change',
        message: 'Ground school timing updated for next week.',
        type: 'fto',
        time: '1d ago',
        isRead: readIds.contains('notif_03'),
      ),
      NotificationItem(
        id: 'notif_04',
        title: 'Instructor Feedback',
        message: 'Capt. Sharma left notes on your last flight.',
        type: 'instructor',
        time: '1d ago',
        isRead: readIds.contains('notif_04'),
      ),
      NotificationItem(
        id: 'notif_05',
        title: 'Notes Synced',
        message: '3 study notes synced successfully.',
        type: 'sync',
        time: '2d ago',
        isRead: readIds.contains('notif_05'),
      ),
    ];

    return ApiResponse(success: true, data: notifications);
  }

  /// Marks a notification as read and persists to Hive.
  Future<void> markAsRead(String notificationId) async {
    final json = _storage.get(_storage.notificationsBox, notificationId);
    if (json != null) {
      json['isRead'] = true;
      await _storage.put(_storage.notificationsBox, notificationId, json);
    } else {
      // Store just the read state
      await _storage.put(_storage.notificationsBox, notificationId, {
        'id': notificationId,
        'isRead': true,
      });
    }
  }
}
