import 'package:freezed_annotation/freezed_annotation.dart';
part 'adminmodel.freezed.dart';
part 'adminmodel.g.dart';

@freezed
abstract class AdminModel implements _$AdminModel {
  const factory AdminModel({
    String? id,
    String? name,
    String? email,
    @Default("https://drive.google.com/file/d/1_IEGfDil4sTy-lpwnLSsSgNtE28E05dn/view?usp=sharing")
        String avatar,
    int? yearid,
    @Default(false) bool? accepted,
    @Default(false) bool? fulladmin,
  }) = _AdminModel;
  const AdminModel._();
  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);
}
