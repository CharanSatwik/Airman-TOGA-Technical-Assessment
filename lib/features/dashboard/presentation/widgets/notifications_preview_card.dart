import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../notifications/data/models/notification_item.dart';

/// Preview of latest notifications for dashboard.
class NotificationsPreviewCard extends StatelessWidget {
  final List<NotificationItem> notifications;

  const NotificationsPreviewCard({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    final unread = notifications.where((n) => !n.isRead).take(2).toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: AppSpacing.cardBorderRadius,
        border: Border.all(color: AppColors.border(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Notifications',
                style: TextStyle(fontFamily: 'PlusJakartaSans', 
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary(context),
                ),
              ),
              GestureDetector(
                onTap: () => context.go('/notifications'),
                child: Row(
                  children: [
                    Text(
                      'View all',
                      style: TextStyle(fontFamily: 'PlusJakartaSans', 
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 12,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (unread.isEmpty)
            Text(
              'You\'re all caught up!',
              style: TextStyle(fontFamily: 'PlusJakartaSans', 
                fontSize: 13,
                color: AppColors.textMuted(context),
              ),
            )
          else
            ...unread.map((n) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              n.title,
                              style: TextStyle(fontFamily: 'PlusJakartaSans', 
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary(context),
                              ),
                            ),
                            Text(
                              n.message,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontFamily: 'PlusJakartaSans', 
                                fontSize: 12,
                                color: AppColors.textMuted(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        n.time,
                        style: TextStyle(fontFamily: 'IBMPlexMono', 
                          fontSize: 11,
                          color: AppColors.textMuted(context),
                        ),
                      ),
                    ],
                  ),
                )),
        ],
      ),
    );
  }
}
