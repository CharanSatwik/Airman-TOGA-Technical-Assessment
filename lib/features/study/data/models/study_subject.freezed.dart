// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_subject.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StudySubject _$StudySubjectFromJson(Map<String, dynamic> json) {
  return _StudySubject.fromJson(json);
}

/// @nodoc
mixin _$StudySubject {
  String get id => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;
  int get lessonsCompleted => throw _privateConstructorUsedError;
  int get totalLessons => throw _privateConstructorUsedError;
  int get quizScore => throw _privateConstructorUsedError;

  /// Serializes this StudySubject to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StudySubject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StudySubjectCopyWith<StudySubject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudySubjectCopyWith<$Res> {
  factory $StudySubjectCopyWith(
    StudySubject value,
    $Res Function(StudySubject) then,
  ) = _$StudySubjectCopyWithImpl<$Res, StudySubject>;
  @useResult
  $Res call({
    String id,
    String subject,
    int progress,
    int lessonsCompleted,
    int totalLessons,
    int quizScore,
  });
}

/// @nodoc
class _$StudySubjectCopyWithImpl<$Res, $Val extends StudySubject>
    implements $StudySubjectCopyWith<$Res> {
  _$StudySubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StudySubject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = null,
    Object? progress = null,
    Object? lessonsCompleted = null,
    Object? totalLessons = null,
    Object? quizScore = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            subject: null == subject
                ? _value.subject
                : subject // ignore: cast_nullable_to_non_nullable
                      as String,
            progress: null == progress
                ? _value.progress
                : progress // ignore: cast_nullable_to_non_nullable
                      as int,
            lessonsCompleted: null == lessonsCompleted
                ? _value.lessonsCompleted
                : lessonsCompleted // ignore: cast_nullable_to_non_nullable
                      as int,
            totalLessons: null == totalLessons
                ? _value.totalLessons
                : totalLessons // ignore: cast_nullable_to_non_nullable
                      as int,
            quizScore: null == quizScore
                ? _value.quizScore
                : quizScore // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StudySubjectImplCopyWith<$Res>
    implements $StudySubjectCopyWith<$Res> {
  factory _$$StudySubjectImplCopyWith(
    _$StudySubjectImpl value,
    $Res Function(_$StudySubjectImpl) then,
  ) = __$$StudySubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String subject,
    int progress,
    int lessonsCompleted,
    int totalLessons,
    int quizScore,
  });
}

/// @nodoc
class __$$StudySubjectImplCopyWithImpl<$Res>
    extends _$StudySubjectCopyWithImpl<$Res, _$StudySubjectImpl>
    implements _$$StudySubjectImplCopyWith<$Res> {
  __$$StudySubjectImplCopyWithImpl(
    _$StudySubjectImpl _value,
    $Res Function(_$StudySubjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StudySubject
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = null,
    Object? progress = null,
    Object? lessonsCompleted = null,
    Object? totalLessons = null,
    Object? quizScore = null,
  }) {
    return _then(
      _$StudySubjectImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        subject: null == subject
            ? _value.subject
            : subject // ignore: cast_nullable_to_non_nullable
                  as String,
        progress: null == progress
            ? _value.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as int,
        lessonsCompleted: null == lessonsCompleted
            ? _value.lessonsCompleted
            : lessonsCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        totalLessons: null == totalLessons
            ? _value.totalLessons
            : totalLessons // ignore: cast_nullable_to_non_nullable
                  as int,
        quizScore: null == quizScore
            ? _value.quizScore
            : quizScore // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StudySubjectImpl extends _StudySubject {
  const _$StudySubjectImpl({
    required this.id,
    required this.subject,
    required this.progress,
    required this.lessonsCompleted,
    required this.totalLessons,
    required this.quizScore,
  }) : super._();

  factory _$StudySubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudySubjectImplFromJson(json);

  @override
  final String id;
  @override
  final String subject;
  @override
  final int progress;
  @override
  final int lessonsCompleted;
  @override
  final int totalLessons;
  @override
  final int quizScore;

  @override
  String toString() {
    return 'StudySubject(id: $id, subject: $subject, progress: $progress, lessonsCompleted: $lessonsCompleted, totalLessons: $totalLessons, quizScore: $quizScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudySubjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.lessonsCompleted, lessonsCompleted) ||
                other.lessonsCompleted == lessonsCompleted) &&
            (identical(other.totalLessons, totalLessons) ||
                other.totalLessons == totalLessons) &&
            (identical(other.quizScore, quizScore) ||
                other.quizScore == quizScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    subject,
    progress,
    lessonsCompleted,
    totalLessons,
    quizScore,
  );

  /// Create a copy of StudySubject
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StudySubjectImplCopyWith<_$StudySubjectImpl> get copyWith =>
      __$$StudySubjectImplCopyWithImpl<_$StudySubjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudySubjectImplToJson(this);
  }
}

abstract class _StudySubject extends StudySubject {
  const factory _StudySubject({
    required final String id,
    required final String subject,
    required final int progress,
    required final int lessonsCompleted,
    required final int totalLessons,
    required final int quizScore,
  }) = _$StudySubjectImpl;
  const _StudySubject._() : super._();

  factory _StudySubject.fromJson(Map<String, dynamic> json) =
      _$StudySubjectImpl.fromJson;

  @override
  String get id;
  @override
  String get subject;
  @override
  int get progress;
  @override
  int get lessonsCompleted;
  @override
  int get totalLessons;
  @override
  int get quizScore;

  /// Create a copy of StudySubject
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StudySubjectImplCopyWith<_$StudySubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
