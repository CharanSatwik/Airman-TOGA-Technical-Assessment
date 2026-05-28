import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:airman_toga/features/auth/data/models/cadet_profile.dart';
import 'package:airman_toga/features/logbook/data/models/logbook_summary.dart';

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
class UpcomingFlight with _$UpcomingFlight {
  const factory UpcomingFlight({
    required String aircraft,
    required String date,
    required String time,
    required String lesson,
  }) = _UpcomingFlight;

  factory UpcomingFlight.fromJson(Map<String, dynamic> json) =>
      _$UpcomingFlightFromJson(json);
}

@freezed
class DashboardData with _$DashboardData {
  const factory DashboardData({
    required CadetProfile cadet,
    required int overallStudyProgress,
    required UpcomingFlight upcomingFlight,
    required LogbookSummary logbook,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);
}
