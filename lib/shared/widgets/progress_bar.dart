import 'package:flutter/material.dart';

/// Animated progress bar with rounded caps.
class ProgressBar extends StatelessWidget {
  final double progress; // 0.0 – 1.0
  final Color? color;
  final double height;

  const ProgressBar({
    super.key,
    required this.progress,
    this.color,
    this.height = 6,
  });

  /// Thin variant for subject cards (6px).
  const ProgressBar.thin({
    super.key,
    required this.progress,
    this.color,
  }) : height = 6;

  /// Thick variant for dashboard (10px).
  const ProgressBar.thick({
    super.key,
    required this.progress,
    this.color,
  }) : height = 10;

  @override
  Widget build(BuildContext context) {
    final barColor = color ?? Theme.of(context).colorScheme.primary;
    final trackColor = barColor.withValues(alpha: 0.12);

    return ClipRRect(
      borderRadius: BorderRadius.circular(height / 2),
      child: SizedBox(
        height: height,
        child: LinearProgressIndicator(
          value: progress.clamp(0.0, 1.0),
          backgroundColor: trackColor,
          valueColor: AlwaysStoppedAnimation(barColor),
          minHeight: height,
        ),
      ),
    );
  }
}
