import 'package:freezed_annotation/freezed_annotation.dart';
part 'notificationmodel.freezed.dart';
part 'notificationmodel.g.dart';

@freezed
abstract class NotificationsModel implements _$NotificationsModel {
  const factory NotificationsModel({
    String? title,
    int? yearid,
  }) = _NotificationsModel;
  const NotificationsModel._();
  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationsModelFromJson(json);
}
