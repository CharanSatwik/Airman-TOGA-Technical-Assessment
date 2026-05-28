import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../shared/widgets/progress_bar.dart';
import '../../../../shared/widgets/status_badge.dart';
import '../../data/models/study_subject.dart';

/// Study subject card with progress bar, lesson count, and status badge.
class SubjectCard extends StatelessWidget {
  final StudySubject subject;

  const SubjectCard({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/study/${subject.id}'),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface(context),
          borderRadius: AppSpacing.cardBorderRadius,
          border: Border.all(color: AppColors.border(context)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    subject.subject,
                    style: TextStyle(fontFamily: 'PlusJakartaSans', 
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary(context),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${subject.progress}%',
                  style: TextStyle(fontFamily: 'IBMPlexMono', 
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMuted(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Progress bar
            ProgressBar.thin(progress: subject.progress / 100),
            const SizedBox(height: 8),

            // Lesson count + quiz score + status
            Row(
              children: [
                Text(
                  '${subject.lessonsCompleted} of ${subject.totalLessons} lessons',
                  style: TextStyle(fontFamily: 'IBMPlexMono', 
                    fontSize: 12,
                    color: AppColors.textMuted(context),
                  ),
                ),
                const Spacer(),
                if (subject.quizScore > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: AppSpacing.badgeBorderRadius,
                    ),
                    child: Text(
                      'Quiz: ${subject.quizScore}%',
                      style: TextStyle(fontFamily: 'IBMPlexMono', 
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: StatusBadge(status: subject.status),
            ),
          ],
        ),
      ),
    );
  }
}
