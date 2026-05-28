import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../shared/widgets/skeleton_loader.dart';
import '../../../../shared/widgets/error_state.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../notifications/providers/notifications_provider.dart';
import '../../providers/dashboard_provider.dart';
import '../widgets/upcoming_flight_card.dart';
import '../widgets/progress_card.dart';
import '../widgets/notifications_preview_card.dart';

/// Main dashboard screen with greeting, stats, and overview cards.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardProvider);
    final notificationsAsync = ref.watch(notificationsProvider);
    final authState = ref.watch(authProvider);
    final padding = ResponsiveUtils.responsivePadding(context);

    final name = authState.valueOrNull?.name.split(' ').first ?? 'Arjun';

    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dashboardProvider);
          ref.invalidate(notificationsProvider);
        },
        child: dashboardAsync.when(
          loading: () => _buildSkeleton(context, padding),
          error: (err, _) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: ErrorState(
                message: 'Failed to load dashboard',
                onRetry: () => ref.invalidate(dashboardProvider),
              ),
            ),
          ),
          data: (data) {
            final maxWidth = ResponsiveUtils.maxContentWidth(context);

            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SafeArea(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: maxWidth ?? double.infinity,
                    ),
                    child: Padding(
                      padding: padding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),

                          // Greeting row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hey $name, \n${_getTimeGreeting()}',
                                    style: AppTextStyles.headingLarge(context),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        DateFormat(
                                          'MMMM d, yyyy',
                                        ).format(DateTime.now()),
                                        style: AppTextStyles.bodySmall(context)
                                            .copyWith(
                                              color: AppColors.textMuted(
                                                context,
                                              ),
                                            ),
                                      ),
                                      const SizedBox(width: 12),
                                      // Streak chip
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColors.accentWarm
                                              .withValues(alpha: 0.12),
                                          borderRadius:
                                              AppSpacing.badgeBorderRadius,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons
                                                  .local_fire_department_rounded,
                                              size: 14,
                                              color: AppColors.accentWarm,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '12 day streak',
                                              style: TextStyle(
                                                fontFamily: 'PlusJakartaSans',
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.accentWarm,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Notification bell
                              IconButton(
                                onPressed: () => context.go('/notifications'),
                                icon: Badge(
                                  isLabelVisible:
                                      (notificationsAsync.valueOrNull
                                              ?.where((n) => !n.isRead)
                                              .length ??
                                          0) >
                                      0,
                                  label: Text(
                                    '${notificationsAsync.valueOrNull?.where((n) => !n.isRead).length ?? 0}',
                                  ),
                                  child: const Icon(
                                    Icons.notifications_outlined,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          // Stat tiles grid
                          _buildStatGrid(context, data),
                          const SizedBox(height: 16),

                          // Upcoming flight
                          UpcomingFlightCard(flight: data.upcomingFlight),
                          const SizedBox(height: 16),

                          // Continue studying
                          ProgressCard(
                            progressPercent: data.overallStudyProgress,
                          ),
                          const SizedBox(height: 16),

                          // Notifications preview
                          notificationsAsync.when(
                            data: (notifications) => NotificationsPreviewCard(
                              notifications: notifications,
                            ),
                            loading: () => const SkeletonLoader(height: 100),
                            error: (_, __) => const SizedBox.shrink(),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatGrid(BuildContext context, dynamic data) {
    final isWide =
        ResponsiveUtils.isMedium(context) ||
        ResponsiveUtils.isExpanded(context);

    final tiles = [
      _StatTile(label: 'TOTAL HOURS', value: '${data.logbook.totalHours}'),
      _StatTile(label: 'SOLO HOURS', value: '${data.logbook.soloHours}'),
      _StatTile(label: 'STUDY', value: '${data.overallStudyProgress}%'),
      _StatTile(label: 'QUIZ AVG', value: '82%'),
    ];

    if (isWide) {
      return Row(
        children: tiles
            .map(
              (t) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: t,
                ),
              ),
            )
            .toList(),
      );
    }

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1.6,
      children: tiles,
    );
  }

  Widget _buildSkeleton(BuildContext context, EdgeInsets padding) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const SkeletonLoader(height: 32, width: 200),
              const SizedBox(height: 8),
              const SkeletonLoader(height: 16, width: 160),
              const SizedBox(height: 24),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.6,
                children: List.generate(
                  4,
                  (_) => const SkeletonLoader(height: 80),
                ),
              ),
              const SizedBox(height: 16),
              const SkeletonLoader(height: 90),
              const SizedBox(height: 16),
              const SkeletonLoader(height: 80),
              const SizedBox(height: 16),
              const SkeletonLoader(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  String _getTimeGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return 'Good morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good afternoon';
    } else if (hour >= 17 && hour < 22) {
      return 'Good evening';
    } else {
      return 'Good night';
    }
  }
}

class _StatTile extends StatelessWidget {
  final String label;
  final String value;

  const _StatTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: AppSpacing.cardBorderRadius,
        border: Border.all(color: AppColors.border(context)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.6,
              color: AppColors.textMuted(context),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              fontFamily: 'IBMPlexMono',
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary(context),
            ),
          ),
        ],
      ),
    );
  }
}
