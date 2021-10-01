import 'package:freezed_annotation/freezed_annotation.dart';
part 'coursemodel.freezed.dart';
part 'coursemodel.g.dart';

@freezed
abstract class CourseModel implements _$CourseModel {
  const factory CourseModel({
    int? id,
    String? icon,
    String? name,
  }) = _CourseModel;
  const CourseModel._();
  factory CourseModel.fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);
}
