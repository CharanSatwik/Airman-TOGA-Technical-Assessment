import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../shared/widgets/skeleton_loader.dart';
import '../../../../shared/widgets/error_state.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../providers/notifications_provider.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifAsync = ref.watch(notificationsProvider);
    final filter = ref.watch(notificationFilterProvider);
    final padding = ResponsiveUtils.responsivePadding(context);

    final unreadCount =
        notifAsync.valueOrNull?.where((n) => !n.isRead).length ?? 0;

    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/dashboard');
              }
            },
          ),
        ),
        title: Row(
          children: [
            const Text('Notifications'),
            if (unreadCount > 0) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: AppSpacing.badgeBorderRadius,
                ),
                child: Text(
                  '$unreadCount',
                  style: TextStyle(
                    fontFamily: 'IBMPlexMono',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      body: Column(
        children: [
          // Filter pills
          Padding(
            padding: padding.copyWith(top: 8, bottom: 12),
            child: Row(
              children: [
                _buildPill(context, ref, 'All', 'all', filter),
                const SizedBox(width: 8),
                _buildPill(context, ref, 'Unread', 'unread', filter),
              ],
            ),
          ),
          Expanded(
            child: notifAsync.when(
              loading: () => ListView.separated(
                padding: padding,
                itemCount: 4,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, __) => const SkeletonLoader(height: 70),
              ),
              error: (err, _) => ErrorState(
                message: 'Failed to load notifications',
                onRetry: () => ref.invalidate(notificationsProvider),
              ),
              data: (notifications) {
                var filtered = notifications;
                if (filter == 'unread') {
                  filtered = notifications.where((n) => !n.isRead).toList();
                }

                if (filtered.isEmpty) {
                  return const EmptyState(
                    message: "You're all caught up",
                    icon: Icons.check_circle_outline,
                  );
                }

                return Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 640),
                    child: ListView.separated(
                      padding: padding,
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (_, i) => NotificationCard(
                        notification: filtered[i],
                        onTap: () => ref
                            .read(notificationsProvider.notifier)
                            .markAsRead(filtered[i].id),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPill(
    BuildContext context,
    WidgetRef ref,
    String label,
    String value,
    String current,
  ) {
    final selected = current == value;
    return GestureDetector(
      onTap: () => ref.read(notificationFilterProvider.notifier).state = value,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: AppSpacing.badgeBorderRadius,
          border: Border.all(
            style: BorderStyle.solid,
            color: selected ? AppColors.primary : AppColors.border(context),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : AppColors.textMuted(context),
          ),
        ),
      ),
    );
  }
}
