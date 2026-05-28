import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/study_note.dart';

/// Note card with sync status indicator and top border color.
class NoteCard extends StatelessWidget {
  final StudyNote note;
  final VoidCallback? onSync;
  final VoidCallback? onRetry;
  final VoidCallback? onDelete;

  const NoteCard({
    super.key,
    required this.note,
    this.onSync,
    this.onRetry,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = _getBorderColor();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: AppSpacing.cardBorderRadius,
        border: Border.all(color: AppColors.border(context)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top color border
          Container(height: 3, color: borderColor),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subject tag and Delete Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withValues(alpha: 0.12),
                        borderRadius: AppSpacing.badgeBorderRadius,
                      ),
                      child: Text(
                        note.subjectName,
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                    if (onDelete != null)
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline_rounded,
                          color: AppColors.textMuted(context),
                          size: 18,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        tooltip: 'Delete Note',
                        onPressed: onDelete,
                      ),
                  ],
                ),
                const SizedBox(height: 2),

                // Content preview
                Text(
                  note.content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 16,
                    height: 1.4,
                    color: AppColors.textPrimary(context),
                  ),
                ),
                const SizedBox(height: 12),

                // Timestamp + sync status
                Row(
                  children: [
                    Text(
                      _formatDate(note.createdAt),
                      style: TextStyle(
                        fontFamily: 'IBMPlexMono',
                        fontSize: 12,
                        color: AppColors.textMuted(context),
                      ),
                    ),
                    const Spacer(),
                    _buildSyncStatus(context),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getBorderColor() {
    switch (note.syncStatus) {
      case 'synced':
        return AppColors.success;
      case 'syncing':
        return AppColors.primary;
      case 'failed':
      case 'pending':
        return AppColors.accentWarm;
      default:
        return AppColors.lightBorder;
    }
  }

  Widget _buildSyncStatus(BuildContext context) {
    switch (note.syncStatus) {
      case 'synced':
        return Text(
          'Synced',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.success,
          ),
        );
      case 'syncing':
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              'Syncing...',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ],
        );
      case 'failed':
        return GestureDetector(
          onTap: onRetry,
          child: Text(
            'Retry',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.danger,
            ),
          ),
        );
      case 'pending':
        return GestureDetector(
          onTap: onSync,
          child: Text(
            'Sync Now',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.accentWarm,
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
