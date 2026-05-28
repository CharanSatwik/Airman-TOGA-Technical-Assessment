import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../shared/widgets/skeleton_loader.dart';
import '../../../../shared/widgets/error_state.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../providers/study_provider.dart';
import '../widgets/subject_card.dart';

/// Study subjects screen with search and filter pills.
class StudySubjectsScreen extends ConsumerWidget {
  const StudySubjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectsAsync = ref.watch(studySubjectsProvider);
    final filter = ref.watch(studyFilterProvider);
    final query = ref.watch(searchQueryProvider);
    final padding = ResponsiveUtils.responsivePadding(context);
    final columns = ResponsiveUtils.responsiveColumns(context);

    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(title: const Text('Study')),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: padding.copyWith(top: 16, bottom: 20),
            child: TextField(
              onChanged: (v) =>
                  ref.read(searchQueryProvider.notifier).state = v,
              decoration: InputDecoration(
                hintText: 'Search subjects...',
                prefixIcon: const Icon(Icons.search, size: 20),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
          ),

          // Filter pills
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: padding.copyWith(top: 0, bottom: 20),
            child: Wrap(
              spacing: 8,
              children: [
                _FilterPill(
                  label: 'All',
                  value: 'all',
                  selected: filter == 'all',
                  ref: ref,
                ),
                _FilterPill(
                  label: 'In Progress',
                  value: 'in_progress',
                  selected: filter == 'in_progress',
                  ref: ref,
                ),
                _FilterPill(
                  label: 'Completed',
                  value: 'completed',
                  selected: filter == 'completed',
                  ref: ref,
                ),
                _FilterPill(
                  label: 'Not Started',
                  value: 'not_started',
                  selected: filter == 'not_started',
                  ref: ref,
                ),
              ],
            ),
          ),

          // Subject list
          Expanded(
            child: subjectsAsync.when(
              loading: () => _buildSkeleton(padding, columns),
              error: (err, _) => ErrorState(
                message: 'Failed to load subjects',
                onRetry: () => ref.invalidate(studySubjectsProvider),
              ),
              data: (allSubjects) {
                final notifier = ref.read(studySubjectsProvider.notifier);
                final filtered = notifier.getFiltered(filter, query);

                if (filtered.isEmpty) {
                  return const EmptyState(
                    message: 'No subjects found',
                    icon: Icons.menu_book_outlined,
                  );
                }

                if (columns == 1) {
                  return ListView.separated(
                    padding: padding.copyWith(top: 0, bottom: 24),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) => SubjectCard(subject: filtered[i]),
                  );
                }

                return GridView.builder(
                  padding: padding.copyWith(top: 0, bottom: 24),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.2,
                  ),
                  itemCount: filtered.length,
                  itemBuilder: (_, i) => SubjectCard(subject: filtered[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkeleton(EdgeInsets padding, int columns) {
    return ListView.separated(
      padding: padding,
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (_, __) => const SkeletonLoader(height: 120),
    );
  }
}

class _FilterPill extends StatelessWidget {
  final String label;
  final String value;
  final bool selected;
  final WidgetRef ref;

  const _FilterPill({
    required this.label,
    required this.value,
    required this.selected,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ref.read(studyFilterProvider.notifier).state = value,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.transparent,
          borderRadius: AppSpacing.badgeBorderRadius,
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border(context),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: selected ? Colors.white : AppColors.textMuted(context),
          ),
        ),
      ),
    );
  }
}
