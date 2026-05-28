import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../shared/widgets/skeleton_loader.dart';
import '../../../../shared/widgets/error_state.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../providers/logbook_provider.dart';
import '../widgets/logbook_stat_card.dart';
import '../widgets/logbook_entry_card.dart';

class LogbookScreen extends ConsumerWidget {
  const LogbookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(logbookSummaryProvider);
    final entriesAsync = ref.watch(logbookEntriesProvider);
    final padding = ResponsiveUtils.responsivePadding(context);

    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(title: const Text('Logbook')),
      body: SingleChildScrollView(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            summaryAsync.when(
              loading: () => const SkeletonLoader(height: 80),
              error: (_, __) => const SizedBox.shrink(),
              data: (summary) => Column(children: [
                Wrap(
                  spacing: 24, runSpacing: 12,
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    LogbookStatCard(label: 'Total Hours', value: '${summary.totalHours}'),
                    LogbookStatCard(label: 'Dual Hours', value: '${summary.dualHours}'),
                    LogbookStatCard(label: 'Solo Hours', value: '${summary.soloHours}'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(children: [
                  Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.textMuted(context)),
                  const SizedBox(width: 6),
                  Text('Last Flight: ${summary.lastFlight}',
                    style: TextStyle(fontFamily: 'IBMPlexMono', fontSize: 12, color: AppColors.textMuted(context))),
                ]),
              ]),
            ),
            const SizedBox(height: 24),
            Text('Recent Flights', style: TextStyle(fontFamily: 'PlusJakartaSans', 
              fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.textPrimary(context))),
            const SizedBox(height: 12),
            entriesAsync.when(
              loading: () => Column(children: List.generate(3, (_) =>
                const Padding(padding: EdgeInsets.only(bottom: 10), child: SkeletonLoader(height: 80)))),
              error: (err, _) => ErrorState(message: 'Failed to load flights',
                onRetry: () => ref.invalidate(logbookEntriesProvider)),
              data: (entries) {
                if (entries.isEmpty) return const EmptyState(message: 'No flights logged yet', icon: Icons.flight_outlined);
                return Column(children: [
                  ...entries.map((e) => Padding(padding: const EdgeInsets.only(bottom: 10), child: LogbookEntryCard(entry: e))),
                  TextButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Add logbook entry coming soon'))),
                    child: const Text('+ Add Entry')),
                ]);
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
