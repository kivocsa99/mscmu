// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClassModel _$$_ClassModelFromJson(Map<String, dynamic> json) =>
    _$_ClassModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      isclinical: json['isclinical'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ClassModelToJson(_$_ClassModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isclinical': instance.isclinical,
    };
