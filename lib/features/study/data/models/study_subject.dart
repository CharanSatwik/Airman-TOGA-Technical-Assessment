import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:airman_toga/core/utils/status_utils.dart';

part 'study_subject.freezed.dart';
part 'study_subject.g.dart';

@freezed
class StudySubject with _$StudySubject {
  const StudySubject._();

  const factory StudySubject({
    required String id,
    required String subject,
    required int progress,
    required int lessonsCompleted,
    required int totalLessons,
    required int quizScore,
  }) = _StudySubject;

  /// Derived status based on progress percentage.
  String get status => StatusUtils.getStatus(progress.clamp(0, 100));

  factory StudySubject.fromJson(Map<String, dynamic> json) =>
      _$StudySubjectFromJson(json);
}
