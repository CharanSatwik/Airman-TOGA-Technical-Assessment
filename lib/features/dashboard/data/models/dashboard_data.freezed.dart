// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpcomingFlight _$UpcomingFlightFromJson(Map<String, dynamic> json) {
  return _UpcomingFlight.fromJson(json);
}

/// @nodoc
mixin _$UpcomingFlight {
  String get aircraft => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get lesson => throw _privateConstructorUsedError;

  /// Serializes this UpcomingFlight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpcomingFlight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpcomingFlightCopyWith<UpcomingFlight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpcomingFlightCopyWith<$Res> {
  factory $UpcomingFlightCopyWith(
    UpcomingFlight value,
    $Res Function(UpcomingFlight) then,
  ) = _$UpcomingFlightCopyWithImpl<$Res, UpcomingFlight>;
  @useResult
  $Res call({String aircraft, String date, String time, String lesson});
}

/// @nodoc
class _$UpcomingFlightCopyWithImpl<$Res, $Val extends UpcomingFlight>
    implements $UpcomingFlightCopyWith<$Res> {
  _$UpcomingFlightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpcomingFlight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aircraft = null,
    Object? date = null,
    Object? time = null,
    Object? lesson = null,
  }) {
    return _then(
      _value.copyWith(
            aircraft: null == aircraft
                ? _value.aircraft
                : aircraft // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String,
            lesson: null == lesson
                ? _value.lesson
                : lesson // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpcomingFlightImplCopyWith<$Res>
    implements $UpcomingFlightCopyWith<$Res> {
  factory _$$UpcomingFlightImplCopyWith(
    _$UpcomingFlightImpl value,
    $Res Function(_$UpcomingFlightImpl) then,
  ) = __$$UpcomingFlightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String aircraft, String date, String time, String lesson});
}

/// @nodoc
class __$$UpcomingFlightImplCopyWithImpl<$Res>
    extends _$UpcomingFlightCopyWithImpl<$Res, _$UpcomingFlightImpl>
    implements _$$UpcomingFlightImplCopyWith<$Res> {
  __$$UpcomingFlightImplCopyWithImpl(
    _$UpcomingFlightImpl _value,
    $Res Function(_$UpcomingFlightImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpcomingFlight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aircraft = null,
    Object? date = null,
    Object? time = null,
    Object? lesson = null,
  }) {
    return _then(
      _$UpcomingFlightImpl(
        aircraft: null == aircraft
            ? _value.aircraft
            : aircraft // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String,
        lesson: null == lesson
            ? _value.lesson
            : lesson // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpcomingFlightImpl implements _UpcomingFlight {
  const _$UpcomingFlightImpl({
    required this.aircraft,
    required this.date,
    required this.time,
    required this.lesson,
  });

  factory _$UpcomingFlightImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpcomingFlightImplFromJson(json);

  @override
  final String aircraft;
  @override
  final String date;
  @override
  final String time;
  @override
  final String lesson;

  @override
  String toString() {
    return 'UpcomingFlight(aircraft: $aircraft, date: $date, time: $time, lesson: $lesson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpcomingFlightImpl &&
            (identical(other.aircraft, aircraft) ||
                other.aircraft == aircraft) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.lesson, lesson) || other.lesson == lesson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, aircraft, date, time, lesson);

  /// Create a copy of UpcomingFlight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpcomingFlightImplCopyWith<_$UpcomingFlightImpl> get copyWith =>
      __$$UpcomingFlightImplCopyWithImpl<_$UpcomingFlightImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpcomingFlightImplToJson(this);
  }
}

abstract class _UpcomingFlight implements UpcomingFlight {
  const factory _UpcomingFlight({
    required final String aircraft,
    required final String date,
    required final String time,
    required final String lesson,
  }) = _$UpcomingFlightImpl;

  factory _UpcomingFlight.fromJson(Map<String, dynamic> json) =
      _$UpcomingFlightImpl.fromJson;

  @override
  String get aircraft;
  @override
  String get date;
  @override
  String get time;
  @override
  String get lesson;

  /// Create a copy of UpcomingFlight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpcomingFlightImplCopyWith<_$UpcomingFlightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) {
  return _DashboardData.fromJson(json);
}

/// @nodoc
mixin _$DashboardData {
  CadetProfile get cadet => throw _privateConstructorUsedError;
  int get overallStudyProgress => throw _privateConstructorUsedError;
  UpcomingFlight get upcomingFlight => throw _privateConstructorUsedError;
  LogbookSummary get logbook => throw _privateConstructorUsedError;

  /// Serializes this DashboardData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
    DashboardData value,
    $Res Function(DashboardData) then,
  ) = _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call({
    CadetProfile cadet,
    int overallStudyProgress,
    UpcomingFlight upcomingFlight,
    LogbookSummary logbook,
  });

  $CadetProfileCopyWith<$Res> get cadet;
  $UpcomingFlightCopyWith<$Res> get upcomingFlight;
  $LogbookSummaryCopyWith<$Res> get logbook;
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cadet = null,
    Object? overallStudyProgress = null,
    Object? upcomingFlight = null,
    Object? logbook = null,
  }) {
    return _then(
      _value.copyWith(
            cadet: null == cadet
                ? _value.cadet
                : cadet // ignore: cast_nullable_to_non_nullable
                      as CadetProfile,
            overallStudyProgress: null == overallStudyProgress
                ? _value.overallStudyProgress
                : overallStudyProgress // ignore: cast_nullable_to_non_nullable
                      as int,
            upcomingFlight: null == upcomingFlight
                ? _value.upcomingFlight
                : upcomingFlight // ignore: cast_nullable_to_non_nullable
                      as UpcomingFlight,
            logbook: null == logbook
                ? _value.logbook
                : logbook // ignore: cast_nullable_to_non_nullable
                      as LogbookSummary,
          )
          as $Val,
    );
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CadetProfileCopyWith<$Res> get cadet {
    return $CadetProfileCopyWith<$Res>(_value.cadet, (value) {
      return _then(_value.copyWith(cadet: value) as $Val);
    });
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpcomingFlightCopyWith<$Res> get upcomingFlight {
    return $UpcomingFlightCopyWith<$Res>(_value.upcomingFlight, (value) {
      return _then(_value.copyWith(upcomingFlight: value) as $Val);
    });
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LogbookSummaryCopyWith<$Res> get logbook {
    return $LogbookSummaryCopyWith<$Res>(_value.logbook, (value) {
      return _then(_value.copyWith(logbook: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
    _$DashboardDataImpl value,
    $Res Function(_$DashboardDataImpl) then,
  ) = __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CadetProfile cadet,
    int overallStudyProgress,
    UpcomingFlight upcomingFlight,
    LogbookSummary logbook,
  });

  @override
  $CadetProfileCopyWith<$Res> get cadet;
  @override
  $UpcomingFlightCopyWith<$Res> get upcomingFlight;
  @override
  $LogbookSummaryCopyWith<$Res> get logbook;
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
    _$DashboardDataImpl _value,
    $Res Function(_$DashboardDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cadet = null,
    Object? overallStudyProgress = null,
    Object? upcomingFlight = null,
    Object? logbook = null,
  }) {
    return _then(
      _$DashboardDataImpl(
        cadet: null == cadet
            ? _value.cadet
            : cadet // ignore: cast_nullable_to_non_nullable
                  as CadetProfile,
        overallStudyProgress: null == overallStudyProgress
            ? _value.overallStudyProgress
            : overallStudyProgress // ignore: cast_nullable_to_non_nullable
                  as int,
        upcomingFlight: null == upcomingFlight
            ? _value.upcomingFlight
            : upcomingFlight // ignore: cast_nullable_to_non_nullable
                  as UpcomingFlight,
        logbook: null == logbook
            ? _value.logbook
            : logbook // ignore: cast_nullable_to_non_nullable
                  as LogbookSummary,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataImpl implements _DashboardData {
  const _$DashboardDataImpl({
    required this.cadet,
    required this.overallStudyProgress,
    required this.upcomingFlight,
    required this.logbook,
  });

  factory _$DashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataImplFromJson(json);

  @override
  final CadetProfile cadet;
  @override
  final int overallStudyProgress;
  @override
  final UpcomingFlight upcomingFlight;
  @override
  final LogbookSummary logbook;

  @override
  String toString() {
    return 'DashboardData(cadet: $cadet, overallStudyProgress: $overallStudyProgress, upcomingFlight: $upcomingFlight, logbook: $logbook)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            (identical(other.cadet, cadet) || other.cadet == cadet) &&
            (identical(other.overallStudyProgress, overallStudyProgress) ||
                other.overallStudyProgress == overallStudyProgress) &&
            (identical(other.upcomingFlight, upcomingFlight) ||
                other.upcomingFlight == upcomingFlight) &&
            (identical(other.logbook, logbook) || other.logbook == logbook));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    cadet,
    overallStudyProgress,
    upcomingFlight,
    logbook,
  );

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataImplToJson(this);
  }
}

abstract class _DashboardData implements DashboardData {
  const factory _DashboardData({
    required final CadetProfile cadet,
    required final int overallStudyProgress,
    required final UpcomingFlight upcomingFlight,
    required final LogbookSummary logbook,
  }) = _$DashboardDataImpl;

  factory _DashboardData.fromJson(Map<String, dynamic> json) =
      _$DashboardDataImpl.fromJson;

  @override
  CadetProfile get cadet;
  @override
  int get overallStudyProgress;
  @override
  UpcomingFlight get upcomingFlight;
  @override
  LogbookSummary get logbook;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
