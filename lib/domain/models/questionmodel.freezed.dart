// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'questionmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
class _$QuestionModelTearOff {
  const _$QuestionModelTearOff();

  _QuestionModel call(
      {String question = '',
      String correct = '',
      List<String> answers = const []}) {
    return _QuestionModel(
      question: question,
      correct: correct,
      answers: answers,
    );
  }

  QuestionModel fromJson(Map<String, Object> json) {
    return QuestionModel.fromJson(json);
  }
}

/// @nodoc
const $QuestionModel = _$QuestionModelTearOff();

/// @nodoc
mixin _$QuestionModel {
  String get question => throw _privateConstructorUsedError;
  String get correct => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionModelCopyWith<QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) then) =
      _$QuestionModelCopyWithImpl<$Res>;
  $Res call({String question, String correct, List<String> answers});
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

  final QuestionModel _value;
  // ignore: unused_field
  final $Res Function(QuestionModel) _then;

  @override
  $Res call({
    Object? question = freezed,
    Object? correct = freezed,
    Object? answers = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$QuestionModelCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$QuestionModelCopyWith(
          _QuestionModel value, $Res Function(_QuestionModel) then) =
      __$QuestionModelCopyWithImpl<$Res>;
  @override
  $Res call({String question, String correct, List<String> answers});
}

/// @nodoc
class __$QuestionModelCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res>
    implements _$QuestionModelCopyWith<$Res> {
  __$QuestionModelCopyWithImpl(
      _QuestionModel _value, $Res Function(_QuestionModel) _then)
      : super(_value, (v) => _then(v as _QuestionModel));

  @override
  _QuestionModel get _value => super._value as _QuestionModel;

  @override
  $Res call({
    Object? question = freezed,
    Object? correct = freezed,
    Object? answers = freezed,
  }) {
    return _then(_QuestionModel(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as String,
      answers: answers == freezed
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionModel extends _QuestionModel {
  const _$_QuestionModel(
      {this.question = '', this.correct = '', this.answers = const []})
      : super._();

  factory _$_QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionModelFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String question;
  @JsonKey(defaultValue: '')
  @override
  final String correct;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> answers;

  @override
  String toString() {
    return 'QuestionModel(question: $question, correct: $correct, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuestionModel &&
            (identical(other.question, question) ||
                const DeepCollectionEquality()
                    .equals(other.question, question)) &&
            (identical(other.correct, correct) ||
                const DeepCollectionEquality()
                    .equals(other.correct, correct)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality().equals(other.answers, answers)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(question) ^
      const DeepCollectionEquality().hash(correct) ^
      const DeepCollectionEquality().hash(answers);

  @JsonKey(ignore: true)
  @override
  _$QuestionModelCopyWith<_QuestionModel> get copyWith =>
      __$QuestionModelCopyWithImpl<_QuestionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionModelToJson(this);
  }
}

abstract class _QuestionModel extends QuestionModel {
  const factory _QuestionModel(
      {String question,
      String correct,
      List<String> answers}) = _$_QuestionModel;
  const _QuestionModel._() : super._();

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$_QuestionModel.fromJson;

  @override
  String get question => throw _privateConstructorUsedError;
  @override
  String get correct => throw _privateConstructorUsedError;
  @override
  List<String> get answers => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuestionModelCopyWith<_QuestionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
