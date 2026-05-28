// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logbook_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogbookSummaryImpl _$$LogbookSummaryImplFromJson(Map<String, dynamic> json) =>
    _$LogbookSummaryImpl(
      totalHours: (json['totalHours'] as num).toDouble(),
      dualHours: (json['dualHours'] as num).toDouble(),
      soloHours: (json['soloHours'] as num).toDouble(),
      lastFlight: json['lastFlight'] as String,
    );

Map<String, dynamic> _$$LogbookSummaryImplToJson(
  _$LogbookSummaryImpl instance,
) => <String, dynamic>{
  'totalHours': instance.totalHours,
  'dualHours': instance.dualHours,
  'soloHours': instance.soloHours,
  'lastFlight': instance.lastFlight,
};
