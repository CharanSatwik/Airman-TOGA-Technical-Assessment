// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudySubjectImpl _$$StudySubjectImplFromJson(Map<String, dynamic> json) =>
    _$StudySubjectImpl(
      id: json['id'] as String,
      subject: json['subject'] as String,
      progress: (json['progress'] as num).toInt(),
      lessonsCompleted: (json['lessonsCompleted'] as num).toInt(),
      totalLessons: (json['totalLessons'] as num).toInt(),
      quizScore: (json['quizScore'] as num).toInt(),
    );

Map<String, dynamic> _$$StudySubjectImplToJson(_$StudySubjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'progress': instance.progress,
      'lessonsCompleted': instance.lessonsCompleted,
      'totalLessons': instance.totalLessons,
      'quizScore': instance.quizScore,
    };
