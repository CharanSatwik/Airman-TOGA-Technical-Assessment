import '../../../core/network/api_response.dart';
import 'package:airman_toga/features/logbook/data/models/logbook_summary.dart';
import 'package:airman_toga/features/logbook/data/models/logbook_entry.dart';

/// Logbook service with mock flight data.
class LogbookService {
  /// Returns logbook summary after 600ms delay.
  Future<ApiResponse<LogbookSummary>> getSummary() async {
    await Future.delayed(const Duration(milliseconds: 600));

    const summary = LogbookSummary(
      totalHours: 42.5,
      dualHours: 28.0,
      soloHours: 14.5,
      lastFlight: 'May 10, 2026',
    );

    return const ApiResponse(success: true, data: summary);
  }

  /// Returns recent logbook entries after 600ms delay.
  Future<ApiResponse<List<LogbookEntry>>> getEntries() async {
    await Future.delayed(const Duration(milliseconds: 600));

    final entries = [
      const LogbookEntry(
        id: 'log_01',
        date: 'May 10, 2026',
        aircraft: 'Cessna 172S',
        route: 'MAA → PNY → MAA',
        duration: 2.5,
        lesson: 'Cross-Country Navigation',
      ),
      const LogbookEntry(
        id: 'log_02',
        date: 'May 7, 2026',
        aircraft: 'Cessna 152',
        route: 'MAA Local',
        duration: 1.5,
        lesson: 'Solo Circuits',
      ),
      const LogbookEntry(
        id: 'log_03',
        date: 'May 4, 2026',
        aircraft: 'Cessna 172S',
        route: 'MAA → TCR',
        duration: 2.0,
        lesson: 'Dual Navigation',
      ),
      const LogbookEntry(
        id: 'log_04',
        date: 'Apr 30, 2026',
        aircraft: 'Cessna 152',
        route: 'MAA Local',
        duration: 1.0,
        lesson: 'Stall Recovery',
      ),
      const LogbookEntry(
        id: 'log_05',
        date: 'Apr 27, 2026',
        aircraft: 'Cessna 172S',
        route: 'MAA → IXM → MAA',
        duration: 3.0,
        lesson: 'Long Cross-Country',
      ),
    ];

    return ApiResponse(success: true, data: entries);
  }
}
