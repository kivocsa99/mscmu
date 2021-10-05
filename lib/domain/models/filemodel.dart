import 'package:freezed_annotation/freezed_annotation.dart';

part 'filemodel.freezed.dart';
part 'filemodel.g.dart';

@freezed
abstract class FileModel implements _$FileModel {
  const factory FileModel({
    int? id,
    String? name,
    String? url,
    String? out_link,
    int? number_downloads,
  }) = _FileModel;
  const FileModel._();
  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}
