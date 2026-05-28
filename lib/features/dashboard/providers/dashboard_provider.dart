import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/providers/auth_provider.dart';
import '../../study/providers/study_provider.dart';
import '../data/dashboard_service.dart';
import '../data/models/dashboard_data.dart';

/// Dashboard provider — auto-refreshes when auth changes.
final dashboardProvider = FutureProvider.autoDispose<DashboardData>((ref) async {
  // Watch auth state to refresh on login/logout
  final authState = ref.watch(authProvider);
  
  // Only fetch if user is authenticated
  if (authState.valueOrNull == null) {
    throw Exception('Not authenticated');
  }

  final service = DashboardService();
  final result = await service.getDashboard();

  if (result.success && result.data != null) {
    final dashboardData = result.data!;
    
    // Watch study progress reactively to dynamically recalculate overall progress
    final subjectsAsync = ref.watch(studySubjectsProvider);
    if (subjectsAsync.hasValue && subjectsAsync.value!.isNotEmpty) {
      final subjects = subjectsAsync.value!;
      final totalProgress = subjects.fold<int>(0, (sum, subject) => sum + subject.progress);
      final calculatedProgress = (totalProgress / subjects.length).round();
      return dashboardData.copyWith(overallStudyProgress: calculatedProgress);
    }
    
    return dashboardData;
  }
  throw Exception(result.error ?? 'Failed to load dashboard');
});
