import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

/// Chapter row with toggle checkbox.
class ChapterRow extends StatelessWidget {
  final String chapterName;
  final bool completed;
  final VoidCallback onToggle;

  const ChapterRow({
    super.key,
    required this.chapterName,
    required this.completed,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onToggle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Row(
          children: [
            // Checkbox
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: completed
                    ? AppColors.secondary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: completed
                      ? AppColors.secondary
                      : AppColors.border(context),
                  width: 2,
                ),
              ),
              child: completed
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                chapterName,
                style: TextStyle(fontFamily: 'PlusJakartaSans', 
                  fontSize: 15,
                  color: completed
                      ? AppColors.textMuted(context)
                      : AppColors.textPrimary(context),
                  decoration:
                      completed ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
