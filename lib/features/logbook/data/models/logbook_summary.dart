import 'package:freezed_annotation/freezed_annotation.dart';

part 'logbook_summary.freezed.dart';
part 'logbook_summary.g.dart';

@freezed
class LogbookSummary with _$LogbookSummary {
  const factory LogbookSummary({
    required double totalHours,
    required double dualHours,
    required double soloHours,
    required String lastFlight,
  }) = _LogbookSummary;

  factory LogbookSummary.fromJson(Map<String, dynamic> json) =>
      _$LogbookSummaryFromJson(json);
}
