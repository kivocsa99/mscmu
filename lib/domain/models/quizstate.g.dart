// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quizstate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuizState _$$_QuizStateFromJson(Map<String, dynamic> json) => _$_QuizState(
      selectedAnswer: json['selectedAnswer'] as String?,
      correct: (json['correct'] as List<dynamic>?)
          ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      incorrect: (json['incorrect'] as List<dynamic>?)
          ?.map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: _$enumDecodeNullable(_$QuizStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$_QuizStateToJson(_$_QuizState instance) =>
    <String, dynamic>{
      'selectedAnswer': instance.selectedAnswer,
      'correct': instance.correct,
      'incorrect': instance.incorrect,
      'status': _$QuizStatusEnumMap[instance.status],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$QuizStatusEnumMap = {
  QuizStatus.initial: 'initial',
  QuizStatus.correct: 'correct',
  QuizStatus.incorrect: 'incorrect',
  QuizStatus.complete: 'complete',
};
