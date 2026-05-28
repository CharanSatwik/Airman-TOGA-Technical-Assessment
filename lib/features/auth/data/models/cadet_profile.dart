import 'package:freezed_annotation/freezed_annotation.dart';
import 'fto_info.dart';
import 'instructor_info.dart';

part 'cadet_profile.freezed.dart';
part 'cadet_profile.g.dart';

@freezed
class CadetProfile with _$CadetProfile {
  const factory CadetProfile({
    required String id,
    required String name,
    required String role,
    required String course,
    required String trainingStage,
    required FTOInfo ftoInfo,
    required InstructorInfo instructorInfo,
    required String base,
    String? token,
  }) = _CadetProfile;

  factory CadetProfile.fromJson(Map<String, dynamic> json) =>
      _$CadetProfileFromJson(json);
}
