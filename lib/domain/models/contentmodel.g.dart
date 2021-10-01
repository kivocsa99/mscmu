// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contentmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentModel _$$_ContentModelFromJson(Map<String, dynamic> json) =>
    _$_ContentModel(
      folders: (json['folders'] as List<dynamic>?)
          ?.map((e) => FolderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => FileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ContentModelToJson(_$_ContentModel instance) =>
    <String, dynamic>{
      'folders': instance.folders,
      'files': instance.files,
    };
