import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/constants/app_spacing.dart';

/// CadetProfileCard widget for the login screen.
class CadetProfileCard extends StatelessWidget {
  final String name;
  final String initials;
  final String courseInfo;
  final String ftoName;
  final String instructorName;
  final String base;

  const CadetProfileCard({
    super.key,
    required this.name,
    required this.initials,
    required this.courseInfo,
    required this.ftoName,
    required this.instructorName,
    required this.base,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      padding: AppSpacing.paddingLg,
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: AppSpacing.cardBorderRadius,
        border: Border.all(color: AppColors.border(context)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar circle with initials
          CircleAvatar(
            radius: 36,
            backgroundColor: AppColors.secondary.withValues(alpha: 0.15),
            child: Text(
              initials,
              style: TextStyle(fontFamily: 'PlusJakartaSans', 
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.secondary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),

          // Name
          Text(
            name,
            style: AppTextStyles.headingMedium(context),
          ),
          const SizedBox(height: AppSpacing.sm),

          // Course tag pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.12),
              borderRadius: AppSpacing.badgeBorderRadius,
            ),
            child: Text(
              courseInfo,
              style: TextStyle(fontFamily: 'PlusJakartaSans', 
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.secondary,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Details
          _buildDetailRow(context, Icons.school_outlined, ftoName),
          const SizedBox(height: AppSpacing.sm),
          _buildDetailRow(context, Icons.person_outline, instructorName),
          const SizedBox(height: AppSpacing.sm),
          _buildDetailRow(context, Icons.location_on_outlined, base),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppColors.textMuted(context)),
        const SizedBox(width: 6),
        Text(
          text,
          style: AppTextStyles.bodySmall(context).copyWith(
            color: AppColors.textMuted(context),
          ),
        ),
      ],
    );
  }
}
