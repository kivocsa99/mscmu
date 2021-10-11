// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificationmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationsModel _$$_NotificationsModelFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationsModel(
      title:
          (json['title'] as List<dynamic>?)?.map((e) => e as String).toList(),
      yearid:
          (json['yearid'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_NotificationsModelToJson(
        _$_NotificationsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'yearid': instance.yearid,
    };
