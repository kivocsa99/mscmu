// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionModel _$$_QuestionModelFromJson(Map<String, dynamic> json) =>
    _$_QuestionModel(
      question: json['question'] as String? ?? '',
      correct: json['correct'] as String? ?? '',
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_QuestionModelToJson(_$_QuestionModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'correct': instance.correct,
      'answers': instance.answers,
    };
