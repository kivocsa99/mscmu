import 'package:freezed_annotation/freezed_annotation.dart';
part 'adminmodel.freezed.dart';
part 'adminmodel.g.dart';

@freezed
abstract class AdminModel implements _$AdminModel {
  const factory AdminModel({
    String? id,
    String? name,
    String? email,
    String? avatar,
    int? yearid,
    bool? accepted,
    bool? fulladmin,
  }) = _AdminModel;
  const AdminModel._();
  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);
}
