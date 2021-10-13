import 'package:freezed_annotation/freezed_annotation.dart';
part 'newsmodel.freezed.dart';
part 'newsmodel.g.dart';

@freezed
abstract class NewsModel implements _$NewsModel {
  const factory NewsModel({
    String? title,
    String? url,
    String? picture,
  }) = _NewsModel;
  const NewsModel._();
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
