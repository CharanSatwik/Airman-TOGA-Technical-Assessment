// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instructor_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstructorInfoImpl _$$InstructorInfoImplFromJson(Map<String, dynamic> json) =>
    _$InstructorInfoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      rank: json['rank'] as String,
      specialization: json['specialization'] as String,
    );

Map<String, dynamic> _$$InstructorInfoImplToJson(
  _$InstructorInfoImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'rank': instance.rank,
  'specialization': instance.specialization,
};
