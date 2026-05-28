import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../data/models/logbook_entry.dart';

/// Expandable logbook entry card.
class LogbookEntryCard extends StatefulWidget {
  final LogbookEntry entry;

  const LogbookEntryCard({super.key, required this.entry});

  @override
  State<LogbookEntryCard> createState() => _LogbookEntryCardState();
}

class _LogbookEntryCardState extends State<LogbookEntryCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface(context),
          borderRadius: AppSpacing.cardBorderRadius,
          border: Border.all(color: AppColors.border(context)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.entry.date,
                  style: TextStyle(fontFamily: 'IBMPlexMono', 
                    fontSize: 12,
                    color: AppColors.textMuted(context),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.12),
                    borderRadius: AppSpacing.badgeBorderRadius,
                  ),
                  child: Text(
                    widget.entry.aircraft,
                    style: TextStyle(fontFamily: 'PlusJakartaSans', 
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.entry.route,
                    style: TextStyle(fontFamily: 'PlusJakartaSans', 
                      fontSize: 13,
                      color: AppColors.textMuted(context),
                    ),
                  ),
                ),
                Text(
                  '${widget.entry.duration}h',
                  style: TextStyle(fontFamily: 'IBMPlexMono', 
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary(context),
                  ),
                ),
              ],
            ),
            // Expandable lesson
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Icon(Icons.menu_book_outlined, size: 14, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Text(
                      widget.entry.lesson,
                      style: TextStyle(fontFamily: 'PlusJakartaSans', 
                        fontSize: 13,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              crossFadeState:
                  _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 200),
            ),
          ],
        ),
      ),
    );
  }
}
