// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quizmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) {
  return _QuizModel.fromJson(json);
}

/// @nodoc
class _$QuizModelTearOff {
  const _$QuizModelTearOff();

  _QuizModel call({String? name, int? yearId, List<QuestionModel>? questions}) {
    return _QuizModel(
      name: name,
      yearId: yearId,
      questions: questions,
    );
  }

  QuizModel fromJson(Map<String, Object> json) {
    return QuizModel.fromJson(json);
  }
}

/// @nodoc
const $QuizModel = _$QuizModelTearOff();

/// @nodoc
mixin _$QuizModel {
  String? get name => throw _privateConstructorUsedError;
  int? get yearId => throw _privateConstructorUsedError;
  List<QuestionModel>? get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizModelCopyWith<QuizModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizModelCopyWith<$Res> {
  factory $QuizModelCopyWith(QuizModel value, $Res Function(QuizModel) then) =
      _$QuizModelCopyWithImpl<$Res>;
  $Res call({String? name, int? yearId, List<QuestionModel>? questions});
}

/// @nodoc
class _$QuizModelCopyWithImpl<$Res> implements $QuizModelCopyWith<$Res> {
  _$QuizModelCopyWithImpl(this._value, this._then);

  final QuizModel _value;
  // ignore: unused_field
  final $Res Function(QuizModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? yearId = freezed,
    Object? questions = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      yearId: yearId == freezed
          ? _value.yearId
          : yearId // ignore: cast_nullable_to_non_nullable
              as int?,
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>?,
    ));
  }
}

/// @nodoc
abstract class _$QuizModelCopyWith<$Res> implements $QuizModelCopyWith<$Res> {
  factory _$QuizModelCopyWith(
          _QuizModel value, $Res Function(_QuizModel) then) =
      __$QuizModelCopyWithImpl<$Res>;
  @override
  $Res call({String? name, int? yearId, List<QuestionModel>? questions});
}

/// @nodoc
class __$QuizModelCopyWithImpl<$Res> extends _$QuizModelCopyWithImpl<$Res>
    implements _$QuizModelCopyWith<$Res> {
  __$QuizModelCopyWithImpl(_QuizModel _value, $Res Function(_QuizModel) _then)
      : super(_value, (v) => _then(v as _QuizModel));

  @override
  _QuizModel get _value => super._value as _QuizModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? yearId = freezed,
    Object? questions = freezed,
  }) {
    return _then(_QuizModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      yearId: yearId == freezed
          ? _value.yearId
          : yearId // ignore: cast_nullable_to_non_nullable
              as int?,
      questions: questions == freezed
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizModel extends _QuizModel {
  const _$_QuizModel({this.name, this.yearId, this.questions}) : super._();

  factory _$_QuizModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuizModelFromJson(json);

  @override
  final String? name;
  @override
  final int? yearId;
  @override
  final List<QuestionModel>? questions;

  @override
  String toString() {
    return 'QuizModel(name: $name, yearId: $yearId, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuizModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.yearId, yearId) ||
                const DeepCollectionEquality().equals(other.yearId, yearId)) &&
            (identical(other.questions, questions) ||
                const DeepCollectionEquality()
                    .equals(other.questions, questions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(yearId) ^
      const DeepCollectionEquality().hash(questions);

  @JsonKey(ignore: true)
  @override
  _$QuizModelCopyWith<_QuizModel> get copyWith =>
      __$QuizModelCopyWithImpl<_QuizModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizModelToJson(this);
  }
}

abstract class _QuizModel extends QuizModel {
  const factory _QuizModel(
      {String? name,
      int? yearId,
      List<QuestionModel>? questions}) = _$_QuizModel;
  const _QuizModel._() : super._();

  factory _QuizModel.fromJson(Map<String, dynamic> json) =
      _$_QuizModel.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  int? get yearId => throw _privateConstructorUsedError;
  @override
  List<QuestionModel>? get questions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuizModelCopyWith<_QuizModel> get copyWith =>
      throw _privateConstructorUsedError;
}
