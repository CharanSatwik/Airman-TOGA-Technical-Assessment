// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instructor_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InstructorInfo _$InstructorInfoFromJson(Map<String, dynamic> json) {
  return _InstructorInfo.fromJson(json);
}

/// @nodoc
mixin _$InstructorInfo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get rank => throw _privateConstructorUsedError;
  String get specialization => throw _privateConstructorUsedError;

  /// Serializes this InstructorInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InstructorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InstructorInfoCopyWith<InstructorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InstructorInfoCopyWith<$Res> {
  factory $InstructorInfoCopyWith(
    InstructorInfo value,
    $Res Function(InstructorInfo) then,
  ) = _$InstructorInfoCopyWithImpl<$Res, InstructorInfo>;
  @useResult
  $Res call({String id, String name, String rank, String specialization});
}

/// @nodoc
class _$InstructorInfoCopyWithImpl<$Res, $Val extends InstructorInfo>
    implements $InstructorInfoCopyWith<$Res> {
  _$InstructorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InstructorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rank = null,
    Object? specialization = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            rank: null == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                      as String,
            specialization: null == specialization
                ? _value.specialization
                : specialization // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InstructorInfoImplCopyWith<$Res>
    implements $InstructorInfoCopyWith<$Res> {
  factory _$$InstructorInfoImplCopyWith(
    _$InstructorInfoImpl value,
    $Res Function(_$InstructorInfoImpl) then,
  ) = __$$InstructorInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String rank, String specialization});
}

/// @nodoc
class __$$InstructorInfoImplCopyWithImpl<$Res>
    extends _$InstructorInfoCopyWithImpl<$Res, _$InstructorInfoImpl>
    implements _$$InstructorInfoImplCopyWith<$Res> {
  __$$InstructorInfoImplCopyWithImpl(
    _$InstructorInfoImpl _value,
    $Res Function(_$InstructorInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InstructorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? rank = null,
    Object? specialization = null,
  }) {
    return _then(
      _$InstructorInfoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        rank: null == rank
            ? _value.rank
            : rank // ignore: cast_nullable_to_non_nullable
                  as String,
        specialization: null == specialization
            ? _value.specialization
            : specialization // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InstructorInfoImpl implements _InstructorInfo {
  const _$InstructorInfoImpl({
    required this.id,
    required this.name,
    required this.rank,
    required this.specialization,
  });

  factory _$InstructorInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InstructorInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String rank;
  @override
  final String specialization;

  @override
  String toString() {
    return 'InstructorInfo(id: $id, name: $name, rank: $rank, specialization: $specialization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InstructorInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.specialization, specialization) ||
                other.specialization == specialization));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, rank, specialization);

  /// Create a copy of InstructorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InstructorInfoImplCopyWith<_$InstructorInfoImpl> get copyWith =>
      __$$InstructorInfoImplCopyWithImpl<_$InstructorInfoImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InstructorInfoImplToJson(this);
  }
}

abstract class _InstructorInfo implements InstructorInfo {
  const factory _InstructorInfo({
    required final String id,
    required final String name,
    required final String rank,
    required final String specialization,
  }) = _$InstructorInfoImpl;

  factory _InstructorInfo.fromJson(Map<String, dynamic> json) =
      _$InstructorInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get rank;
  @override
  String get specialization;

  /// Create a copy of InstructorInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InstructorInfoImplCopyWith<_$InstructorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
