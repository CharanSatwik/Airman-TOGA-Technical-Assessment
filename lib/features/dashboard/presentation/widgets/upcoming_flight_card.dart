import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../dashboard/data/models/dashboard_data.dart';

/// Upcoming flight card with left accent border.
class UpcomingFlightCard extends StatelessWidget {
  final UpcomingFlight flight;

  const UpcomingFlightCard({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: AppSpacing.cardBorderRadius,
        border: Border.all(color: AppColors.border(context)),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Left accent border
            Container(
              width: 3,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSpacing.cardRadius),
                  bottomLeft: Radius.circular(AppSpacing.cardRadius),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.flight_takeoff_rounded,
                      color: AppColors.secondary,
                      size: 28,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            flight.aircraft,
                            style: TextStyle(fontFamily: 'PlusJakartaSans', 
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary(context),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${flight.date} · ${flight.time}',
                            style: TextStyle(fontFamily: 'IBMPlexMono', 
                              fontSize: 12,
                              color: AppColors.textMuted(context),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            flight.lesson,
                            style: TextStyle(fontFamily: 'PlusJakartaSans', 
                              fontSize: 13,
                              color: AppColors.textMuted(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
