import '../../../core/network/api_response.dart';
import 'package:airman_toga/features/auth/data/models/cadet_profile.dart';
import 'package:airman_toga/features/auth/data/models/fto_info.dart';
import 'package:airman_toga/features/auth/data/models/instructor_info.dart';
import 'package:airman_toga/features/logbook/data/models/logbook_summary.dart';
import 'package:airman_toga/features/dashboard/data/models/dashboard_data.dart';

/// Dashboard service with mock data.
class DashboardService {
  /// Returns full dashboard data after 800ms delay.
  Future<ApiResponse<DashboardData>> getDashboard() async {
    await Future.delayed(const Duration(milliseconds: 800));

    final data = DashboardData(
      cadet: const CadetProfile(
        id: 'cadet_001',
        name: 'Arjun Menon',
        role: 'Cadet',
        course: 'PPL',
        trainingStage: 'Navigation Phase',
        ftoInfo: FTOInfo(
          id: 'fto_001',
          name: 'AIRMAN Flight Academy',
          location: 'Chennai',
          contactEmail: 'info@airmanflight.com',
        ),
        instructorInfo: InstructorInfo(
          id: 'instr_001',
          name: 'Capt. R. Sharma',
          rank: 'Captain',
          specialization: 'Navigation & VFR',
        ),
        base: 'Chennai',
      ),
      overallStudyProgress: 64,
      upcomingFlight: const UpcomingFlight(
        aircraft: 'Cessna 172S',
        date: 'May 30, 2026',
        time: '06:30 AM',
        lesson: 'Cross-Country Navigation',
      ),
      logbook: const LogbookSummary(
        totalHours: 42.5,
        dualHours: 28.0,
        soloHours: 14.5,
        lastFlight: 'May 10, 2026',
      ),
    );

    return ApiResponse(success: true, data: data);
  }
}
