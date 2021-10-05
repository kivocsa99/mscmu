import 'package:freezed_annotation/freezed_annotation.dart';
part 'questionmodel.freezed.dart';
part 'questionmodel.g.dart';

@freezed
abstract class QuestionModel implements _$QuestionModel {
  const factory QuestionModel({
    String? question,
    String? correct,
    List<String>? answers,
  }) = _QuestionModel;
  const QuestionModel._();
  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
