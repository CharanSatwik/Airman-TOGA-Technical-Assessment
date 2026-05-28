import 'package:freezed_annotation/freezed_annotation.dart';

part 'fto_info.freezed.dart';
part 'fto_info.g.dart';

@freezed
class FTOInfo with _$FTOInfo {
  const factory FTOInfo({
    required String id,
    required String name,
    required String location,
    required String contactEmail,
  }) = _FTOInfo;

  factory FTOInfo.fromJson(Map<String, dynamic> json) =>
      _$FTOInfoFromJson(json);
}
