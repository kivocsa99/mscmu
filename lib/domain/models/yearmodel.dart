import 'package:freezed_annotation/freezed_annotation.dart';
import 'classmodel.dart';
import 'postmodel.dart';
part 'yearmodel.freezed.dart';
part 'yearmodel.g.dart';

@freezed
abstract class YearsModel implements _$YearsModel {
  const factory YearsModel({
    @Default([]) List<ClassModel> classes,
  

  }) = _YearsModel;
  const YearsModel._();
  factory YearsModel.fromJson(Map<String, dynamic> json) =>
      _$YearsModelFromJson(json);
}
