import 'package:freezed_annotation/freezed_annotation.dart';

part 'foldermodel.freezed.dart';
part 'foldermodel.g.dart';

@freezed
abstract class FolderModel implements _$FolderModel {
  const factory FolderModel({
    int? id,
    String? name,
  }) = _FolderModel;
  const FolderModel._();
  factory FolderModel.fromJson(Map<String, dynamic> json) =>
      _$FolderModelFromJson(json);
}
