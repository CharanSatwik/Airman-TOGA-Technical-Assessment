// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StudyNote _$StudyNoteFromJson(Map<String, dynamic> json) {
  return _StudyNote.fromJson(json);
}

/// @nodoc
mixin _$StudyNote {
  String get id => throw _privateConstructorUsedError;
  String get subjectId => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get syncStatus => throw _privateConstructorUsedError;

  /// Serializes this StudyNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudyNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudyNoteCopyWith<StudyNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudyNoteCopyWith<$Res> {
  factory $StudyNoteCopyWith(StudyNote value, $Res Function(StudyNote) then) =
      _$StudyNoteCopyWithImpl<$Res, StudyNote>;
  @useResult
  $Res call({
    String id,
    String subjectId,
    String subjectName,
    String content,
    DateTime createdAt,
    String syncStatus,
  });
}

/// @nodoc
class _$StudyNoteCopyWithImpl<$Res, $Val extends StudyNote>
    implements $StudyNoteCopyWith<$Res> {
  _$StudyNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudyNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectId = null,
    Object? subjectName = null,
    Object? content = null,
    Object? createdAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            subjectId: null == subjectId
                ? _value.subjectId
                : subjectId // ignore: cast_nullable_to_non_nullable
                      as String,
            subjectName: null == subjectName
                ? _value.subjectName
                : subjectName // ignore: cast_nullable_to_non_nullable
                      as String,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            syncStatus: null == syncStatus
                ? _value.syncStatus
                : syncStatus // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StudyNoteImplCopyWith<$Res>
    implements $StudyNoteCopyWith<$Res> {
  factory _$$StudyNoteImplCopyWith(
    _$StudyNoteImpl value,
    $Res Function(_$StudyNoteImpl) then,
  ) = __$$StudyNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String subjectId,
    String subjectName,
    String content,
    DateTime createdAt,
    String syncStatus,
  });
}

/// @nodoc
class __$$StudyNoteImplCopyWithImpl<$Res>
    extends _$StudyNoteCopyWithImpl<$Res, _$StudyNoteImpl>
    implements _$$StudyNoteImplCopyWith<$Res> {
  __$$StudyNoteImplCopyWithImpl(
    _$StudyNoteImpl _value,
    $Res Function(_$StudyNoteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StudyNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectId = null,
    Object? subjectName = null,
    Object? content = null,
    Object? createdAt = null,
    Object? syncStatus = null,
  }) {
    return _then(
      _$StudyNoteImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        subjectId: null == subjectId
            ? _value.subjectId
            : subjectId // ignore: cast_nullable_to_non_nullable
                  as String,
        subjectName: null == subjectName
            ? _value.subjectName
            : subjectName // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        syncStatus: null == syncStatus
            ? _value.syncStatus
            : syncStatus // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StudyNoteImpl implements _StudyNote {
  const _$StudyNoteImpl({
    required this.id,
    required this.subjectId,
    required this.subjectName,
    required this.content,
    required this.createdAt,
    this.syncStatus = 'pending',
  });

  factory _$StudyNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudyNoteImplFromJson(json);

  @override
  final String id;
  @override
  final String subjectId;
  @override
  final String subjectName;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final String syncStatus;

  @override
  String toString() {
    return 'StudyNote(id: $id, subjectId: $subjectId, subjectName: $subjectName, content: $content, createdAt: $createdAt, syncStatus: $syncStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudyNoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    subjectId,
    subjectName,
    content,
    createdAt,
    syncStatus,
  );

  /// Create a copy of StudyNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudyNoteImplCopyWith<_$StudyNoteImpl> get copyWith =>
      __$$StudyNoteImplCopyWithImpl<_$StudyNoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudyNoteImplToJson(this);
  }
}

abstract class _StudyNote implements StudyNote {
  const factory _StudyNote({
    required final String id,
    required final String subjectId,
    required final String subjectName,
    required final String content,
    required final DateTime createdAt,
    final String syncStatus,
  }) = _$StudyNoteImpl;

  factory _StudyNote.fromJson(Map<String, dynamic> json) =
      _$StudyNoteImpl.fromJson;

  @override
  String get id;
  @override
  String get subjectId;
  @override
  String get subjectName;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  String get syncStatus;

  /// Create a copy of StudyNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudyNoteImplCopyWith<_$StudyNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
