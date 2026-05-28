import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/logbook_service.dart';
import '../data/models/logbook_summary.dart';
import '../data/models/logbook_entry.dart';

/// Logbook summary provider.
final logbookSummaryProvider =
    FutureProvider.autoDispose<LogbookSummary>((ref) async {
  final service = LogbookService();
  final result = await service.getSummary();
  if (result.success && result.data != null) {
    return result.data!;
  }
  throw Exception(result.error ?? 'Failed to load logbook');
});

/// Logbook entries provider.
final logbookEntriesProvider =
    FutureProvider.autoDispose<List<LogbookEntry>>((ref) async {
  final service = LogbookService();
  final result = await service.getEntries();
  if (result.success && result.data != null) {
    return result.data!;
  }
  throw Exception(result.error ?? 'Failed to load entries');
});
