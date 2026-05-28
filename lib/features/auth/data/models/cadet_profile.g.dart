// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadet_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CadetProfileImpl _$$CadetProfileImplFromJson(Map<String, dynamic> json) =>
    _$CadetProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      course: json['course'] as String,
      trainingStage: json['trainingStage'] as String,
      ftoInfo: FTOInfo.fromJson(json['ftoInfo'] as Map<String, dynamic>),
      instructorInfo: InstructorInfo.fromJson(
        json['instructorInfo'] as Map<String, dynamic>,
      ),
      base: json['base'] as String,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$CadetProfileImplToJson(_$CadetProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'course': instance.course,
      'trainingStage': instance.trainingStage,
      'ftoInfo': instance.ftoInfo,
      'instructorInfo': instance.instructorInfo,
      'base': instance.base,
      'token': instance.token,
    };
