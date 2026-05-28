// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cadet_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CadetProfile _$CadetProfileFromJson(Map<String, dynamic> json) {
  return _CadetProfile.fromJson(json);
}

/// @nodoc
mixin _$CadetProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get course => throw _privateConstructorUsedError;
  String get trainingStage => throw _privateConstructorUsedError;
  FTOInfo get ftoInfo => throw _privateConstructorUsedError;
  InstructorInfo get instructorInfo => throw _privateConstructorUsedError;
  String get base => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;

  /// Serializes this CadetProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CadetProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CadetProfileCopyWith<CadetProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CadetProfileCopyWith<$Res> {
  factory $CadetProfileCopyWith(
    CadetProfile value,
    $Res Function(CadetProfile) then,
  ) = _$CadetProfileCopyWithImpl<$Res, CadetProfile>;
  @useResult
  $Res call({
    String id,
    String name,
    String role,
    String course,
    String trainingStage,
    FTOInfo ftoInfo,
    InstructorInfo instructorInfo,
    String base,
    String? token,
  });

  $FTOInfoCopyWith<$Res> get ftoInfo;
  $InstructorInfoCopyWith<$Res> get instructorInfo;
}

/// @nodoc
class _$CadetProfileCopyWithImpl<$Res, $Val extends CadetProfile>
    implements $CadetProfileCopyWith<$Res> {
  _$CadetProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CadetProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? course = null,
    Object? trainingStage = null,
    Object? ftoInfo = null,
    Object? instructorInfo = null,
    Object? base = null,
    Object? token = freezed,
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
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            course: null == course
                ? _value.course
                : course // ignore: cast_nullable_to_non_nullable
                      as String,
            trainingStage: null == trainingStage
                ? _value.trainingStage
                : trainingStage // ignore: cast_nullable_to_non_nullable
                      as String,
            ftoInfo: null == ftoInfo
                ? _value.ftoInfo
                : ftoInfo // ignore: cast_nullable_to_non_nullable
                      as FTOInfo,
            instructorInfo: null == instructorInfo
                ? _value.instructorInfo
                : instructorInfo // ignore: cast_nullable_to_non_nullable
                      as InstructorInfo,
            base: null == base
                ? _value.base
                : base // ignore: cast_nullable_to_non_nullable
                      as String,
            token: freezed == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of CadetProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FTOInfoCopyWith<$Res> get ftoInfo {
    return $FTOInfoCopyWith<$Res>(_value.ftoInfo, (value) {
      return _then(_value.copyWith(ftoInfo: value) as $Val);
    });
  }

  /// Create a copy of CadetProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InstructorInfoCopyWith<$Res> get instructorInfo {
    return $InstructorInfoCopyWith<$Res>(_value.instructorInfo, (value) {
      return _then(_value.copyWith(instructorInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CadetProfileImplCopyWith<$Res>
    implements $CadetProfileCopyWith<$Res> {
  factory _$$CadetProfileImplCopyWith(
    _$CadetProfileImpl value,
    $Res Function(_$CadetProfileImpl) then,
  ) = __$$CadetProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String role,
    String course,
    String trainingStage,
    FTOInfo ftoInfo,
    InstructorInfo instructorInfo,
    String base,
    String? token,
  });

  @override
  $FTOInfoCopyWith<$Res> get ftoInfo;
  @override
  $InstructorInfoCopyWith<$Res> get instructorInfo;
}

/// @nodoc
class __$$CadetProfileImplCopyWithImpl<$Res>
    extends _$CadetProfileCopyWithImpl<$Res, _$CadetProfileImpl>
    implements _$$CadetProfileImplCopyWith<$Res> {
  __$$CadetProfileImplCopyWithImpl(
    _$CadetProfileImpl _value,
    $Res Function(_$CadetProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CadetProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? role = null,
    Object? course = null,
    Object? trainingStage = null,
    Object? ftoInfo = null,
    Object? instructorInfo = null,
    Object? base = null,
    Object? token = freezed,
  }) {
    return _then(
      _$CadetProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        course: null == course
            ? _value.course
            : course // ignore: cast_nullable_to_non_nullable
                  as String,
        trainingStage: null == trainingStage
            ? _value.trainingStage
            : trainingStage // ignore: cast_nullable_to_non_nullable
                  as String,
        ftoInfo: null == ftoInfo
            ? _value.ftoInfo
            : ftoInfo // ignore: cast_nullable_to_non_nullable
                  as FTOInfo,
        instructorInfo: null == instructorInfo
            ? _value.instructorInfo
            : instructorInfo // ignore: cast_nullable_to_non_nullable
                  as InstructorInfo,
        base: null == base
            ? _value.base
            : base // ignore: cast_nullable_to_non_nullable
                  as String,
        token: freezed == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CadetProfileImpl implements _CadetProfile {
  const _$CadetProfileImpl({
    required this.id,
    required this.name,
    required this.role,
    required this.course,
    required this.trainingStage,
    required this.ftoInfo,
    required this.instructorInfo,
    required this.base,
    this.token,
  });

  factory _$CadetProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$CadetProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String role;
  @override
  final String course;
  @override
  final String trainingStage;
  @override
  final FTOInfo ftoInfo;
  @override
  final InstructorInfo instructorInfo;
  @override
  final String base;
  @override
  final String? token;

  @override
  String toString() {
    return 'CadetProfile(id: $id, name: $name, role: $role, course: $course, trainingStage: $trainingStage, ftoInfo: $ftoInfo, instructorInfo: $instructorInfo, base: $base, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CadetProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.trainingStage, trainingStage) ||
                other.trainingStage == trainingStage) &&
            (identical(other.ftoInfo, ftoInfo) || other.ftoInfo == ftoInfo) &&
            (identical(other.instructorInfo, instructorInfo) ||
                other.instructorInfo == instructorInfo) &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    role,
    course,
    trainingStage,
    ftoInfo,
    instructorInfo,
    base,
    token,
  );

  /// Create a copy of CadetProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CadetProfileImplCopyWith<_$CadetProfileImpl> get copyWith =>
      __$$CadetProfileImplCopyWithImpl<_$CadetProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CadetProfileImplToJson(this);
  }
}

abstract class _CadetProfile implements CadetProfile {
  const factory _CadetProfile({
    required final String id,
    required final String name,
    required final String role,
    required final String course,
    required final String trainingStage,
    required final FTOInfo ftoInfo,
    required final InstructorInfo instructorInfo,
    required final String base,
    final String? token,
  }) = _$CadetProfileImpl;

  factory _CadetProfile.fromJson(Map<String, dynamic> json) =
      _$CadetProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get role;
  @override
  String get course;
  @override
  String get trainingStage;
  @override
  FTOInfo get ftoInfo;
  @override
  InstructorInfo get instructorInfo;
  @override
  String get base;
  @override
  String? get token;

  /// Create a copy of CadetProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CadetProfileImplCopyWith<_$CadetProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
