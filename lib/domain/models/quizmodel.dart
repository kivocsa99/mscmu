import 'package:freezed_annotation/freezed_annotation.dart';
import 'postmodel.dart';
import 'questionmodel.dart';
part 'quizmodel.freezed.dart';
part 'quizmodel.g.dart';

@freezed
abstract class QuizModel implements _$QuizModel {
  const factory QuizModel({
     String? name,
     int? yearId,
    List<QuestionModel>? questions,
  }) = _QuizModel;
  const QuizModel._();
  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);
}
