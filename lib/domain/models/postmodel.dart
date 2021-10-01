import 'package:freezed_annotation/freezed_annotation.dart';
part 'postmodel.freezed.dart';
part 'postmodel.g.dart';

@freezed
abstract class PostModel implements _$PostModel {
  const factory PostModel({
    int? yearid,
    String? title,
    String? body,
    String? adminavatar,
    String? adminname,
    String? time,
    String? image,
  }) = _PostModel;
  const PostModel._();
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
