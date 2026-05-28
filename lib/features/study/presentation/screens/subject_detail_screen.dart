import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../shared/widgets/skeleton_loader.dart';
import '../../../../shared/widgets/error_state.dart';
import '../../providers/study_provider.dart';
import '../widgets/chapter_row.dart';

/// Subject detail screen with progress ring, action chips, and chapter list.
class SubjectDetailScreen extends ConsumerWidget {
  final String subjectId;

  const SubjectDetailScreen({super.key, required this.subjectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chaptersAsync = ref.watch(subjectDetailProvider(subjectId));
    final toggleState = ref.watch(chapterToggleProvider);
    final subjectsAsync = ref.watch(studySubjectsProvider);
    final padding = ResponsiveUtils.responsivePadding(context);

    // Get subject name
    final subjectName =
        subjectsAsync.valueOrNull
            ?.where((s) => s.id == subjectId)
            .firstOrNull
            ?.subject ??
        'Subject';

    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(title: Text(subjectName)),
      body: chaptersAsync.when(
        loading: () => Padding(
          padding: padding,
          child: Column(
            children: [
              const SizedBox(height: 32),
              const SkeletonLoader(height: 150, width: 150, borderRadius: 75),
              const SizedBox(height: 24),
              ...List.generate(
                5,
                (_) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const SkeletonLoader(height: 44),
                ),
              ),
            ],
          ),
        ),
        error: (err, _) => ErrorState(
          message: 'Failed to load chapters',
          onRetry: () => ref.invalidate(subjectDetailProvider(subjectId)),
        ),
        data: (chapters) {
          final completedCount = chapters.where((c) {
            final override = toggleState[c.id];
            return override ?? c.completed;
          }).length;
          final progress = chapters.isEmpty
              ? 0.0
              : completedCount / chapters.length;

          return SingleChildScrollView(
            padding: padding,
            child: Column(
              children: [
                const SizedBox(height: 24),

                // Progress ring
                SizedBox(
                  width: 140,
                  height: 140,
                  child: CustomPaint(
                    painter: _ProgressRingPainter(
                      progress: progress,
                      color: AppColors.primary,
                      trackColor: AppColors.primary.withValues(alpha: 0.12),
                    ),
                    child: Center(
                      child: Text(
                        '${(progress * 100).round()}%',
                        style: TextStyle(
                          fontFamily: 'IBMPlexMono',
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary(context),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Action chips
                Wrap(
                  spacing: 10,
                  children: [
                    _ActionChip(
                      label: 'Quiz',
                      icon: Icons.quiz_outlined,
                      context: context,
                      color: const Color.fromARGB(255, 3, 3, 3),
                    ),
                    _ActionChip(
                      label: 'Flashcards',
                      icon: Icons.style_outlined,
                      context: context,
                      color: const Color.fromARGB(255, 11, 11, 11),
                    ),
                    _ActionChip(
                      label: 'Practice Test',
                      icon: Icons.assignment_outlined,
                      context: context,
                      color: const Color.fromARGB(255, 3, 3, 3),
                    ),
                  ],
                ),
                const SizedBox(height: 28),

                // Chapters header
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Chapters',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary(context),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Chapter list
                ...chapters.map((chapter) {
                  final isCompleted =
                      toggleState[chapter.id] ?? chapter.completed;
                  return ChapterRow(
                    chapterName: chapter.chapterName,
                    completed: isCompleted,
                    onToggle: () => ref
                        .read(chapterToggleProvider.notifier)
                        .toggle(chapter.id, isCompleted),
                  );
                }),
                const SizedBox(height: 20),

                // Ask AIRMAN AI row
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.auto_awesome,
                              color: AppColors.primary,
                              size: 32,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'AIRMAN AI will help you clarify aviation concepts here.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                fontSize: 15,
                                color: AppColors.textPrimary(context),
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.surface(context),
                      borderRadius: AppSpacing.cardBorderRadius,
                      border: Border.all(color: AppColors.border(context)),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          size: 18,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Ask AIRMAN AI',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 14,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final BuildContext context;
  final Color color;

  const _ActionChip({
    required this.label,
    required this.icon,
    required this.context,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ActionChip(
      avatar: Icon(icon, size: 16, color: AppColors.secondary),
      label: Text(
        label,
        style: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : color,
        ),
      ),
      onPressed: () {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$label coming soon')));
      },
      side: BorderSide(color: AppColors.secondary.withValues(alpha: 0.4)),
      backgroundColor: AppColors.surface(context),
    );
  }
}

class _ProgressRingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color trackColor;

  _ProgressRingPainter({
    required this.progress,
    required this.color,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 8;
    const strokeWidth = 10.0;

    // Track
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = trackColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    // Progress arc
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _ProgressRingPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
