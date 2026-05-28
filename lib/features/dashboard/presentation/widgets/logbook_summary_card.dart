import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../logbook/data/models/logbook_summary.dart';

/// Logbook summary card for dashboard.
class LogbookSummaryCard extends StatelessWidget {
  final LogbookSummary logbook;

  const LogbookSummaryCard({super.key, required this.logbook});

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
          Text(
            'Logbook',
            style: TextStyle(fontFamily: 'PlusJakartaSans', 
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted(context),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildStat(context, 'Total', '${logbook.totalHours}h'),
              const SizedBox(width: 24),
              _buildStat(context, 'Dual', '${logbook.dualHours}h'),
              const SizedBox(width: 24),
              _buildStat(context, 'Solo', '${logbook.soloHours}h'),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Last Flight: ${logbook.lastFlight}',
            style: TextStyle(fontFamily: 'IBMPlexMono', 
              fontSize: 11,
              color: AppColors.textMuted(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(fontFamily: 'PlusJakartaSans', 
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
            color: AppColors.textMuted(context),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(fontFamily: 'IBMPlexMono', 
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary(context),
          ),
        ),
      ],
    );
  }
}
