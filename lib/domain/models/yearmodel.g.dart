// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yearmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_YearsModel _$$_YearsModelFromJson(Map<String, dynamic> json) =>
    _$_YearsModel(
      classes: (json['classes'] as List<dynamic>?)
              ?.map((e) => ClassModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_YearsModelToJson(_$_YearsModel instance) =>
    <String, dynamic>{
      'classes': instance.classes,
    };
