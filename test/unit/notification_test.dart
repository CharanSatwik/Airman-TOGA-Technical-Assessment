import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:airman_toga/core/storage/hive_storage.dart';
import 'package:airman_toga/features/notifications/data/notification_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory tempDir;
  late NotificationService notificationService;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('hive_notif_test_dir');
    await HiveStorage.instance.init(tempDir.path);
    notificationService = NotificationService();
  });

  tearDown(() async {
    // Release locks
    await Hive.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('NotificationService Tests', () {
    test('should fetch initial list of 5 mock notifications with isRead as false', () async {
      final response = await notificationService.getNotifications();
      expect(response.success, isTrue);
      expect(response.data, isNotNull);
      expect(response.data!.length, 5);
      
      for (final notif in response.data!) {
        expect(notif.isRead, isFalse);
      }
    });

    test('should mark notification as read and persist the state in Hive', () async {
      // Mark notif_01 as read
      await notificationService.markAsRead('notif_01');

      // Fetch notifications again and confirm notif_01 is now read
      final response = await notificationService.getNotifications();
      expect(response.success, isTrue);
      
      final notif01 = response.data!.firstWhere((n) => n.id == 'notif_01');
      expect(notif01.isRead, isTrue);

      final otherNotifs = response.data!.where((n) => n.id != 'notif_01');
      for (final notif in otherNotifs) {
        expect(notif.isRead, isFalse);
      }
    });
  });
}
