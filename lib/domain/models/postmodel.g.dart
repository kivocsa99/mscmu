// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      yearid: json['yearid'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      adminavatar: json['adminavatar'] as String?,
      adminname: json['adminname'] as String?,
      time: json['time'],
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'yearid': instance.yearid,
      'title': instance.title,
      'body': instance.body,
      'adminavatar': instance.adminavatar,
      'adminname': instance.adminname,
      'time': instance.time,
      'image': instance.image,
    };
