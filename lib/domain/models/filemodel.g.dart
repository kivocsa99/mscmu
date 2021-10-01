// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileModel _$$_FileModelFromJson(Map<String, dynamic> json) => _$_FileModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      out_link: json['out_link'] as String?,
      number_downloads: json['number_downloads'] as int?,
    );

Map<String, dynamic> _$$_FileModelToJson(_$_FileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'out_link': instance.out_link,
      'number_downloads': instance.number_downloads,
    };
