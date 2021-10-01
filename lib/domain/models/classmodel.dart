import 'package:freezed_annotation/freezed_annotation.dart';
part 'classmodel.freezed.dart';
part 'classmodel.g.dart';

@freezed
abstract class ClassModel implements _$ClassModel {
  const factory ClassModel({
    @Default(0) int id,
    @Default('') String name,
    @Default(false) bool isclinical,

  }) = _ClassModel;
  const ClassModel._();
  factory ClassModel.fromJson(Map<String, dynamic> json) =>
      _$ClassModelFromJson(json);
}
