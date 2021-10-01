import 'package:freezed_annotation/freezed_annotation.dart';
part 'mainfoldermodel.freezed.dart';
part 'mainfoldermodel.g.dart';

@freezed
abstract class MainFolderModel implements _$MainFolderModel {
  const factory MainFolderModel({
    int? id,
    String? name,
  }) = _MainFolderModel;
  const MainFolderModel._();
  factory MainFolderModel.fromJson(Map<String, dynamic> json) =>
      _$MainFolderModelFromJson(json);
}
