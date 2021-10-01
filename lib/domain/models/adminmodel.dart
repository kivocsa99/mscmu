import 'package:freezed_annotation/freezed_annotation.dart';
part 'adminmodel.freezed.dart';
part 'adminmodel.g.dart';

@freezed
abstract class AdminModel implements _$AdminModel {
  const factory AdminModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String email,
    @Default('') String avatar,
    @Default(0) int yearid,
    @Default(false) bool accepted,
    @Default(false) bool fulladmin,

  }) = _AdminModel;
  const AdminModel._();
  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);
}
