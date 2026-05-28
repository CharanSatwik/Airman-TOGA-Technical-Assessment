import 'package:freezed_annotation/freezed_annotation.dart';

part 'instructor_info.freezed.dart';
part 'instructor_info.g.dart';

@freezed
class InstructorInfo with _$InstructorInfo {
  const factory InstructorInfo({
    required String id,
    required String name,
    required String rank,
    required String specialization,
  }) = _InstructorInfo;

  factory InstructorInfo.fromJson(Map<String, dynamic> json) =>
      _$InstructorInfoFromJson(json);
}
