// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizModel _$$_QuizModelFromJson(Map<String, dynamic> json) => _$_QuizModel(
      name: json['name'] as String?,
      yearId: json['yearId'] as int?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuizModelToJson(_$_QuizModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'yearId': instance.yearId,
      'questions': instance.questions,
    };
