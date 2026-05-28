import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/notification_item.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;
  final VoidCallback onTap;

  const NotificationCard({super.key, required this.notification, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: notification.isRead
              ? AppColors.surface(context)
              : AppColors.surface(context),
          borderRadius: AppSpacing.cardBorderRadius,
          border: Border.all(color: AppColors.border(context)),
        ),
        clipBehavior: Clip.antiAlias,
        child: IntrinsicHeight(
          child: Row(
            children: [
              if (!notification.isRead)
                Container(width: 3, color: AppColors.primary),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      _buildIcon(),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(notification.title,
                              style: TextStyle(fontFamily: 'PlusJakartaSans', 
                                fontSize: 14, fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary(context))),
                            const SizedBox(height: 2),
                            Text(notification.message, maxLines: 1, overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontFamily: 'PlusJakartaSans', 
                                fontSize: 13, color: AppColors.textMuted(context))),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(notification.time,
                        style: TextStyle(fontFamily: 'IBMPlexMono', fontSize: 11, color: AppColors.textMuted(context))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    final (icon, color) = switch (notification.type) {
      'flight' => (Icons.flight_rounded, AppColors.secondary),
      'study' => (Icons.menu_book_rounded, AppColors.primary),
      'fto' => (Icons.business_rounded, AppColors.lightTextMuted),
      'instructor' => (Icons.person_rounded, AppColors.success),
      'sync' => (Icons.sync_rounded, AppColors.accentWarm),
      _ => (Icons.notifications_rounded, AppColors.lightTextMuted),
    };
    return Icon(icon, size: 18, color: color);
  }
}
