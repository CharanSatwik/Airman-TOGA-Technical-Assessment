import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/notification_item.dart';
import '../data/notification_service.dart';

/// Filter for notifications screen: "all" | "unread"
final notificationFilterProvider = StateProvider<String>((ref) => 'all');

/// Notifications state notifier.
class NotificationsNotifier extends AsyncNotifier<List<NotificationItem>> {
  final NotificationService _service = NotificationService();

  @override
  Future<List<NotificationItem>> build() async {
    final result = await _service.getNotifications();
    if (result.success && result.data != null) {
      return result.data!;
    }
    throw Exception(result.error ?? 'Failed to load notifications');
  }

  /// Optimistic mark-as-read: updates state immediately, then persists.
  Future<void> markAsRead(String id) async {
    state = state.whenData((notifications) {
      return notifications.map((n) {
        if (n.id == id) return n.copyWith(isRead: true);
        return n;
      }).toList();
    });

    await _service.markAsRead(id);
  }

  /// Get unread count.
  int get unreadCount {
    return state.valueOrNull?.where((n) => !n.isRead).length ?? 0;
  }
}

final notificationsProvider =
    AsyncNotifierProvider<NotificationsNotifier, List<NotificationItem>>(
  NotificationsNotifier.new,
);
