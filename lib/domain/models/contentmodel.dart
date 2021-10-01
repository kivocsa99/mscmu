import 'package:freezed_annotation/freezed_annotation.dart';
import 'filemodel.dart';
import 'foldermodel.dart';
part 'contentmodel.freezed.dart';
part 'contentmodel.g.dart';

@freezed
abstract class ContentModel implements _$ContentModel {
  const factory ContentModel({
    List<FolderModel>? folders,
    List<FileModel>? files,


  }) = _ContentModel;
  const ContentModel._();
  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);
}
