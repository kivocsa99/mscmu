// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adminmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdminModel _$$_AdminModelFromJson(Map<String, dynamic> json) =>
    _$_AdminModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String? ??
          'https://drive.google.com/file/d/1_IEGfDil4sTy-lpwnLSsSgNtE28E05dn/view?usp=sharing',
      yearid: json['yearid'] as int?,
      accepted: json['accepted'] as bool? ?? false,
      fulladmin: json['fulladmin'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AdminModelToJson(_$_AdminModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'yearid': instance.yearid,
      'accepted': instance.accepted,
      'fulladmin': instance.fulladmin,
    };
