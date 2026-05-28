import 'package:freezed_annotation/freezed_annotation.dart';

part 'logbook_entry.freezed.dart';
part 'logbook_entry.g.dart';

@freezed
class LogbookEntry with _$LogbookEntry {
  const factory LogbookEntry({
    required String id,
    required String date,
    required String aircraft,
    required String route,
    required double duration,
    required String lesson,
  }) = _LogbookEntry;

  factory LogbookEntry.fromJson(Map<String, dynamic> json) =>
      _$LogbookEntryFromJson(json);
}
