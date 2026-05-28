import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_spacing.dart';

/// Color-coded status pill badge with text label.
class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final (bgColor, fgColor) = _getColors();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.12),
        borderRadius: AppSpacing.badgeBorderRadius,
      ),
      child: Text(
        status,
        style: TextStyle(fontFamily: 'PlusJakartaSans', 
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: fgColor,
        ),
      ),
    );
  }

  (Color, Color) _getColors() {
    switch (status.toLowerCase()) {
      case 'completed':
        return (AppColors.success, AppColors.success);
      case 'in progress':
        return (AppColors.accentWarm, AppColors.accentWarm);
      case 'not started':
        return (AppColors.lightTextMuted, AppColors.lightTextMuted);
      case 'pending':
        return (AppColors.accentWarm, AppColors.accentWarm);
      case 'syncing':
      case 'syncing...':
        return (AppColors.primary, AppColors.primary);
      case 'synced':
        return (AppColors.success, AppColors.success);
      case 'failed':
        return (AppColors.danger, AppColors.danger);
      default:
        return (AppColors.lightTextMuted, AppColors.lightTextMuted);
    }
  }
}
