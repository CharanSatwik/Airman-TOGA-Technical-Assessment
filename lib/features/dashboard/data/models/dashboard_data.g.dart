// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpcomingFlightImpl _$$UpcomingFlightImplFromJson(Map<String, dynamic> json) =>
    _$UpcomingFlightImpl(
      aircraft: json['aircraft'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      lesson: json['lesson'] as String,
    );

Map<String, dynamic> _$$UpcomingFlightImplToJson(
  _$UpcomingFlightImpl instance,
) => <String, dynamic>{
  'aircraft': instance.aircraft,
  'date': instance.date,
  'time': instance.time,
  'lesson': instance.lesson,
};

_$DashboardDataImpl _$$DashboardDataImplFromJson(Map<String, dynamic> json) =>
    _$DashboardDataImpl(
      cadet: CadetProfile.fromJson(json['cadet'] as Map<String, dynamic>),
      overallStudyProgress: (json['overallStudyProgress'] as num).toInt(),
      upcomingFlight: UpcomingFlight.fromJson(
        json['upcomingFlight'] as Map<String, dynamic>,
      ),
      logbook: LogbookSummary.fromJson(json['logbook'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardDataImplToJson(_$DashboardDataImpl instance) =>
    <String, dynamic>{
      'cadet': instance.cadet,
      'overallStudyProgress': instance.overallStudyProgress,
      'upcomingFlight': instance.upcomingFlight,
      'logbook': instance.logbook,
    };
