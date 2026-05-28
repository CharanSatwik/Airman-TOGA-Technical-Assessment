// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logbook_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogbookEntryImpl _$$LogbookEntryImplFromJson(Map<String, dynamic> json) =>
    _$LogbookEntryImpl(
      id: json['id'] as String,
      date: json['date'] as String,
      aircraft: json['aircraft'] as String,
      route: json['route'] as String,
      duration: (json['duration'] as num).toDouble(),
      lesson: json['lesson'] as String,
    );

Map<String, dynamic> _$$LogbookEntryImplToJson(_$LogbookEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'aircraft': instance.aircraft,
      'route': instance.route,
      'duration': instance.duration,
      'lesson': instance.lesson,
    };
