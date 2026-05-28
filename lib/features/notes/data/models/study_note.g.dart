// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudyNoteImpl _$$StudyNoteImplFromJson(Map<String, dynamic> json) =>
    _$StudyNoteImpl(
      id: json['id'] as String,
      subjectId: json['subjectId'] as String,
      subjectName: json['subjectName'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      syncStatus: json['syncStatus'] as String? ?? 'pending',
    );

Map<String, dynamic> _$$StudyNoteImplToJson(_$StudyNoteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'syncStatus': instance.syncStatus,
    };
