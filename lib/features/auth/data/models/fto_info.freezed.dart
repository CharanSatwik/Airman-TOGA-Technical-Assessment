// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fto_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FTOInfo _$FTOInfoFromJson(Map<String, dynamic> json) {
  return _FTOInfo.fromJson(json);
}

/// @nodoc
mixin _$FTOInfo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get contactEmail => throw _privateConstructorUsedError;

  /// Serializes this FTOInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FTOInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FTOInfoCopyWith<FTOInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FTOInfoCopyWith<$Res> {
  factory $FTOInfoCopyWith(FTOInfo value, $Res Function(FTOInfo) then) =
      _$FTOInfoCopyWithImpl<$Res, FTOInfo>;
  @useResult
  $Res call({String id, String name, String location, String contactEmail});
}

/// @nodoc
class _$FTOInfoCopyWithImpl<$Res, $Val extends FTOInfo>
    implements $FTOInfoCopyWith<$Res> {
  _$FTOInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FTOInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? contactEmail = null,
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
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            contactEmail: null == contactEmail
                ? _value.contactEmail
                : contactEmail // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FTOInfoImplCopyWith<$Res> implements $FTOInfoCopyWith<$Res> {
  factory _$$FTOInfoImplCopyWith(
    _$FTOInfoImpl value,
    $Res Function(_$FTOInfoImpl) then,
  ) = __$$FTOInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String location, String contactEmail});
}

/// @nodoc
class __$$FTOInfoImplCopyWithImpl<$Res>
    extends _$FTOInfoCopyWithImpl<$Res, _$FTOInfoImpl>
    implements _$$FTOInfoImplCopyWith<$Res> {
  __$$FTOInfoImplCopyWithImpl(
    _$FTOInfoImpl _value,
    $Res Function(_$FTOInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FTOInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
    Object? contactEmail = null,
  }) {
    return _then(
      _$FTOInfoImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        contactEmail: null == contactEmail
            ? _value.contactEmail
            : contactEmail // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FTOInfoImpl implements _FTOInfo {
  const _$FTOInfoImpl({
    required this.id,
    required this.name,
    required this.location,
    required this.contactEmail,
  });

  factory _$FTOInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FTOInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String location;
  @override
  final String contactEmail;

  @override
  String toString() {
    return 'FTOInfo(id: $id, name: $name, location: $location, contactEmail: $contactEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FTOInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.contactEmail, contactEmail) ||
                other.contactEmail == contactEmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, location, contactEmail);

  /// Create a copy of FTOInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FTOInfoImplCopyWith<_$FTOInfoImpl> get copyWith =>
      __$$FTOInfoImplCopyWithImpl<_$FTOInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FTOInfoImplToJson(this);
  }
}

abstract class _FTOInfo implements FTOInfo {
  const factory _FTOInfo({
    required final String id,
    required final String name,
    required final String location,
    required final String contactEmail,
  }) = _$FTOInfoImpl;

  factory _FTOInfo.fromJson(Map<String, dynamic> json) = _$FTOInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get location;
  @override
  String get contactEmail;

  /// Create a copy of FTOInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FTOInfoImplCopyWith<_$FTOInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
