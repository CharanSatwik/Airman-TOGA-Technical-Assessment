import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

/// Logbook stat card for the stat row.
class LogbookStatCard extends StatelessWidget {
  final String label;
  final String value;

  const LogbookStatCard({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(fontFamily: 'PlusJakartaSans', 
            fontSize: 10,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.6,
            color: AppColors.textMuted(context),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontFamily: 'IBMPlexMono', 
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary(context),
          ),
        ),
      ],
    );
  }
}
