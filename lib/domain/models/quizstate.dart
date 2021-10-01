import 'package:freezed_annotation/freezed_annotation.dart';
import 'postmodel.dart';
import 'questionmodel.dart';
part 'quizstate.freezed.dart';
part 'quizstate.g.dart';

enum QuizStatus { initial, correct, incorrect, complete }

@freezed
abstract class QuizState implements _$QuizState {
  const factory QuizState({
    @Default('') String selectedAnswer,
    @Default([]) List<QuestionModel> correct,
    @Default([]) List<QuestionModel> incorrect,
    QuizStatus? status,
  }) = _QuizState;
  const QuizState._();
  factory QuizState.fromJson(Map<String, dynamic> json) =>
      _$QuizStateFromJson(json);
  factory QuizState.initial() {
    return QuizState(
      selectedAnswer: '',
      correct: [],
      incorrect: [],
      status: QuizStatus.initial,
    );
  }
  bool get answered =>
      status == QuizStatus.incorrect || status == QuizStatus.correct;
}
