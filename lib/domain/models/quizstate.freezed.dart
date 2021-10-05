// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quizstate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizState _$QuizStateFromJson(Map<String, dynamic> json) {
  return _QuizState.fromJson(json);
}

/// @nodoc
class _$QuizStateTearOff {
  const _$QuizStateTearOff();

  _QuizState call(
      {String? selectedAnswer,
      List<QuestionModel>? correct,
      List<QuestionModel>? incorrect,
      QuizStatus? status}) {
    return _QuizState(
      selectedAnswer: selectedAnswer,
      correct: correct,
      incorrect: incorrect,
      status: status,
    );
  }

  QuizState fromJson(Map<String, Object> json) {
    return QuizState.fromJson(json);
  }
}

/// @nodoc
const $QuizState = _$QuizStateTearOff();

/// @nodoc
mixin _$QuizState {
  String? get selectedAnswer => throw _privateConstructorUsedError;
  List<QuestionModel>? get correct => throw _privateConstructorUsedError;
  List<QuestionModel>? get incorrect => throw _privateConstructorUsedError;
  QuizStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizStateCopyWith<QuizState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizStateCopyWith<$Res> {
  factory $QuizStateCopyWith(QuizState value, $Res Function(QuizState) then) =
      _$QuizStateCopyWithImpl<$Res>;
  $Res call(
      {String? selectedAnswer,
      List<QuestionModel>? correct,
      List<QuestionModel>? incorrect,
      QuizStatus? status});
}

/// @nodoc
class _$QuizStateCopyWithImpl<$Res> implements $QuizStateCopyWith<$Res> {
  _$QuizStateCopyWithImpl(this._value, this._then);

  final QuizState _value;
  // ignore: unused_field
  final $Res Function(QuizState) _then;

  @override
  $Res call({
    Object? selectedAnswer = freezed,
    Object? correct = freezed,
    Object? incorrect = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      selectedAnswer: selectedAnswer == freezed
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>?,
      incorrect: incorrect == freezed
          ? _value.incorrect
          : incorrect // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as QuizStatus?,
    ));
  }
}

/// @nodoc
abstract class _$QuizStateCopyWith<$Res> implements $QuizStateCopyWith<$Res> {
  factory _$QuizStateCopyWith(
          _QuizState value, $Res Function(_QuizState) then) =
      __$QuizStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? selectedAnswer,
      List<QuestionModel>? correct,
      List<QuestionModel>? incorrect,
      QuizStatus? status});
}

/// @nodoc
class __$QuizStateCopyWithImpl<$Res> extends _$QuizStateCopyWithImpl<$Res>
    implements _$QuizStateCopyWith<$Res> {
  __$QuizStateCopyWithImpl(_QuizState _value, $Res Function(_QuizState) _then)
      : super(_value, (v) => _then(v as _QuizState));

  @override
  _QuizState get _value => super._value as _QuizState;

  @override
  $Res call({
    Object? selectedAnswer = freezed,
    Object? correct = freezed,
    Object? incorrect = freezed,
    Object? status = freezed,
  }) {
    return _then(_QuizState(
      selectedAnswer: selectedAnswer == freezed
          ? _value.selectedAnswer
          : selectedAnswer // ignore: cast_nullable_to_non_nullable
              as String?,
      correct: correct == freezed
          ? _value.correct
          : correct // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>?,
      incorrect: incorrect == freezed
          ? _value.incorrect
          : incorrect // ignore: cast_nullable_to_non_nullable
              as List<QuestionModel>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as QuizStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizState extends _QuizState {
  const _$_QuizState(
      {this.selectedAnswer, this.correct, this.incorrect, this.status})
      : super._();

  factory _$_QuizState.fromJson(Map<String, dynamic> json) =>
      _$$_QuizStateFromJson(json);

  @override
  final String? selectedAnswer;
  @override
  final List<QuestionModel>? correct;
  @override
  final List<QuestionModel>? incorrect;
  @override
  final QuizStatus? status;

  @override
  String toString() {
    return 'QuizState(selectedAnswer: $selectedAnswer, correct: $correct, incorrect: $incorrect, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuizState &&
            (identical(other.selectedAnswer, selectedAnswer) ||
                const DeepCollectionEquality()
                    .equals(other.selectedAnswer, selectedAnswer)) &&
            (identical(other.correct, correct) ||
                const DeepCollectionEquality()
                    .equals(other.correct, correct)) &&
            (identical(other.incorrect, incorrect) ||
                const DeepCollectionEquality()
                    .equals(other.incorrect, incorrect)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedAnswer) ^
      const DeepCollectionEquality().hash(correct) ^
      const DeepCollectionEquality().hash(incorrect) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$QuizStateCopyWith<_QuizState> get copyWith =>
      __$QuizStateCopyWithImpl<_QuizState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizStateToJson(this);
  }
}

abstract class _QuizState extends QuizState {
  const factory _QuizState(
      {String? selectedAnswer,
      List<QuestionModel>? correct,
      List<QuestionModel>? incorrect,
      QuizStatus? status}) = _$_QuizState;
  const _QuizState._() : super._();

  factory _QuizState.fromJson(Map<String, dynamic> json) =
      _$_QuizState.fromJson;

  @override
  String? get selectedAnswer => throw _privateConstructorUsedError;
  @override
  List<QuestionModel>? get correct => throw _privateConstructorUsedError;
  @override
  List<QuestionModel>? get incorrect => throw _privateConstructorUsedError;
  @override
  QuizStatus? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuizStateCopyWith<_QuizState> get copyWith =>
      throw _privateConstructorUsedError;
}
