// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logbook_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LogbookSummary _$LogbookSummaryFromJson(Map<String, dynamic> json) {
  return _LogbookSummary.fromJson(json);
}

/// @nodoc
mixin _$LogbookSummary {
  double get totalHours => throw _privateConstructorUsedError;
  double get dualHours => throw _privateConstructorUsedError;
  double get soloHours => throw _privateConstructorUsedError;
  String get lastFlight => throw _privateConstructorUsedError;

  /// Serializes this LogbookSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogbookSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogbookSummaryCopyWith<LogbookSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogbookSummaryCopyWith<$Res> {
  factory $LogbookSummaryCopyWith(
    LogbookSummary value,
    $Res Function(LogbookSummary) then,
  ) = _$LogbookSummaryCopyWithImpl<$Res, LogbookSummary>;
  @useResult
  $Res call({
    double totalHours,
    double dualHours,
    double soloHours,
    String lastFlight,
  });
}

/// @nodoc
class _$LogbookSummaryCopyWithImpl<$Res, $Val extends LogbookSummary>
    implements $LogbookSummaryCopyWith<$Res> {
  _$LogbookSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogbookSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalHours = null,
    Object? dualHours = null,
    Object? soloHours = null,
    Object? lastFlight = null,
  }) {
    return _then(
      _value.copyWith(
            totalHours: null == totalHours
                ? _value.totalHours
                : totalHours // ignore: cast_nullable_to_non_nullable
                      as double,
            dualHours: null == dualHours
                ? _value.dualHours
                : dualHours // ignore: cast_nullable_to_non_nullable
                      as double,
            soloHours: null == soloHours
                ? _value.soloHours
                : soloHours // ignore: cast_nullable_to_non_nullable
                      as double,
            lastFlight: null == lastFlight
                ? _value.lastFlight
                : lastFlight // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LogbookSummaryImplCopyWith<$Res>
    implements $LogbookSummaryCopyWith<$Res> {
  factory _$$LogbookSummaryImplCopyWith(
    _$LogbookSummaryImpl value,
    $Res Function(_$LogbookSummaryImpl) then,
  ) = __$$LogbookSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalHours,
    double dualHours,
    double soloHours,
    String lastFlight,
  });
}

/// @nodoc
class __$$LogbookSummaryImplCopyWithImpl<$Res>
    extends _$LogbookSummaryCopyWithImpl<$Res, _$LogbookSummaryImpl>
    implements _$$LogbookSummaryImplCopyWith<$Res> {
  __$$LogbookSummaryImplCopyWithImpl(
    _$LogbookSummaryImpl _value,
    $Res Function(_$LogbookSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LogbookSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalHours = null,
    Object? dualHours = null,
    Object? soloHours = null,
    Object? lastFlight = null,
  }) {
    return _then(
      _$LogbookSummaryImpl(
        totalHours: null == totalHours
            ? _value.totalHours
            : totalHours // ignore: cast_nullable_to_non_nullable
                  as double,
        dualHours: null == dualHours
            ? _value.dualHours
            : dualHours // ignore: cast_nullable_to_non_nullable
                  as double,
        soloHours: null == soloHours
            ? _value.soloHours
            : soloHours // ignore: cast_nullable_to_non_nullable
                  as double,
        lastFlight: null == lastFlight
            ? _value.lastFlight
            : lastFlight // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LogbookSummaryImpl implements _LogbookSummary {
  const _$LogbookSummaryImpl({
    required this.totalHours,
    required this.dualHours,
    required this.soloHours,
    required this.lastFlight,
  });

  factory _$LogbookSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogbookSummaryImplFromJson(json);

  @override
  final double totalHours;
  @override
  final double dualHours;
  @override
  final double soloHours;
  @override
  final String lastFlight;

  @override
  String toString() {
    return 'LogbookSummary(totalHours: $totalHours, dualHours: $dualHours, soloHours: $soloHours, lastFlight: $lastFlight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogbookSummaryImpl &&
            (identical(other.totalHours, totalHours) ||
                other.totalHours == totalHours) &&
            (identical(other.dualHours, dualHours) ||
                other.dualHours == dualHours) &&
            (identical(other.soloHours, soloHours) ||
                other.soloHours == soloHours) &&
            (identical(other.lastFlight, lastFlight) ||
                other.lastFlight == lastFlight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalHours, dualHours, soloHours, lastFlight);

  /// Create a copy of LogbookSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogbookSummaryImplCopyWith<_$LogbookSummaryImpl> get copyWith =>
      __$$LogbookSummaryImplCopyWithImpl<_$LogbookSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LogbookSummaryImplToJson(this);
  }
}

abstract class _LogbookSummary implements LogbookSummary {
  const factory _LogbookSummary({
    required final double totalHours,
    required final double dualHours,
    required final double soloHours,
    required final String lastFlight,
  }) = _$LogbookSummaryImpl;

  factory _LogbookSummary.fromJson(Map<String, dynamic> json) =
      _$LogbookSummaryImpl.fromJson;

  @override
  double get totalHours;
  @override
  double get dualHours;
  @override
  double get soloHours;
  @override
  String get lastFlight;

  /// Create a copy of LogbookSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogbookSummaryImplCopyWith<_$LogbookSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
