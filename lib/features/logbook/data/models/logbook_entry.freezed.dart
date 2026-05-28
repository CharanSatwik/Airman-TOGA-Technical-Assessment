// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logbook_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LogbookEntry _$LogbookEntryFromJson(Map<String, dynamic> json) {
  return _LogbookEntry.fromJson(json);
}

/// @nodoc
mixin _$LogbookEntry {
  String get id => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get aircraft => throw _privateConstructorUsedError;
  String get route => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;
  String get lesson => throw _privateConstructorUsedError;

  /// Serializes this LogbookEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogbookEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogbookEntryCopyWith<LogbookEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogbookEntryCopyWith<$Res> {
  factory $LogbookEntryCopyWith(
    LogbookEntry value,
    $Res Function(LogbookEntry) then,
  ) = _$LogbookEntryCopyWithImpl<$Res, LogbookEntry>;
  @useResult
  $Res call({
    String id,
    String date,
    String aircraft,
    String route,
    double duration,
    String lesson,
  });
}

/// @nodoc
class _$LogbookEntryCopyWithImpl<$Res, $Val extends LogbookEntry>
    implements $LogbookEntryCopyWith<$Res> {
  _$LogbookEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogbookEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? aircraft = null,
    Object? route = null,
    Object? duration = null,
    Object? lesson = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            aircraft: null == aircraft
                ? _value.aircraft
                : aircraft // ignore: cast_nullable_to_non_nullable
                      as String,
            route: null == route
                ? _value.route
                : route // ignore: cast_nullable_to_non_nullable
                      as String,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$LogbookEntryImplCopyWith<$Res>
    implements $LogbookEntryCopyWith<$Res> {
  factory _$$LogbookEntryImplCopyWith(
    _$LogbookEntryImpl value,
    $Res Function(_$LogbookEntryImpl) then,
  ) = __$$LogbookEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String date,
    String aircraft,
    String route,
    double duration,
    String lesson,
  });
}

/// @nodoc
class __$$LogbookEntryImplCopyWithImpl<$Res>
    extends _$LogbookEntryCopyWithImpl<$Res, _$LogbookEntryImpl>
    implements _$$LogbookEntryImplCopyWith<$Res> {
  __$$LogbookEntryImplCopyWithImpl(
    _$LogbookEntryImpl _value,
    $Res Function(_$LogbookEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LogbookEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? aircraft = null,
    Object? route = null,
    Object? duration = null,
    Object? lesson = null,
  }) {
    return _then(
      _$LogbookEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        aircraft: null == aircraft
            ? _value.aircraft
            : aircraft // ignore: cast_nullable_to_non_nullable
                  as String,
        route: null == route
            ? _value.route
            : route // ignore: cast_nullable_to_non_nullable
                  as String,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as double,
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
class _$LogbookEntryImpl implements _LogbookEntry {
  const _$LogbookEntryImpl({
    required this.id,
    required this.date,
    required this.aircraft,
    required this.route,
    required this.duration,
    required this.lesson,
  });

  factory _$LogbookEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogbookEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String date;
  @override
  final String aircraft;
  @override
  final String route;
  @override
  final double duration;
  @override
  final String lesson;

  @override
  String toString() {
    return 'LogbookEntry(id: $id, date: $date, aircraft: $aircraft, route: $route, duration: $duration, lesson: $lesson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogbookEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.aircraft, aircraft) ||
                other.aircraft == aircraft) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.lesson, lesson) || other.lesson == lesson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, date, aircraft, route, duration, lesson);

  /// Create a copy of LogbookEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogbookEntryImplCopyWith<_$LogbookEntryImpl> get copyWith =>
      __$$LogbookEntryImplCopyWithImpl<_$LogbookEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogbookEntryImplToJson(this);
  }
}

abstract class _LogbookEntry implements LogbookEntry {
  const factory _LogbookEntry({
    required final String id,
    required final String date,
    required final String aircraft,
    required final String route,
    required final double duration,
    required final String lesson,
  }) = _$LogbookEntryImpl;

  factory _LogbookEntry.fromJson(Map<String, dynamic> json) =
      _$LogbookEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get date;
  @override
  String get aircraft;
  @override
  String get route;
  @override
  double get duration;
  @override
  String get lesson;

  /// Create a copy of LogbookEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogbookEntryImplCopyWith<_$LogbookEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
