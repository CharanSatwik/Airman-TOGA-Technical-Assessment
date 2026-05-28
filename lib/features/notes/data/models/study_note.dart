import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_note.freezed.dart';
part 'study_note.g.dart';

@freezed
class StudyNote with _$StudyNote {
  const factory StudyNote({
    required String id,
    required String subjectId,
    required String subjectName,
    required String content,
    required DateTime createdAt,
    @Default('pending') String syncStatus,
  }) = _StudyNote;

  factory StudyNote.fromJson(Map<String, dynamic> json) =>
      _$StudyNoteFromJson(json);
}
