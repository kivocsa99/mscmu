// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsModel _$$_NewsModelFromJson(Map<String, dynamic> json) => _$_NewsModel(
      title:
          (json['title'] as List<dynamic>?)?.map((e) => e as String).toList(),
      picture:
          (json['picture'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_NewsModelToJson(_$_NewsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'picture': instance.picture,
    };
