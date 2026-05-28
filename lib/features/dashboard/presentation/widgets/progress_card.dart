import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../shared/widgets/progress_bar.dart';

/// Overall study progress card for dashboard.
class ProgressCard extends StatelessWidget {
  final int progressPercent;

  const ProgressCard({super.key, required this.progressPercent});

  @override
  Widget build(BuildContext context) {
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
                'Continue Studying',
                style: TextStyle(fontFamily: 'PlusJakartaSans', 
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary(context),
                ),
              ),
              Text(
                '$progressPercent%',
                style: TextStyle(fontFamily: 'IBMPlexMono', 
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ProgressBar.thick(
            progress: progressPercent / 100,
          ),
          const SizedBox(height: 8),
          Text(
            'Overall Study Progress',
            style: TextStyle(fontFamily: 'PlusJakartaSans', 
              fontSize: 12,
              color: AppColors.textMuted(context),
            ),
          ),
        ],
      ),
    );
  }
}
