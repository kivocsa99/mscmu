// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'yearmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

YearsModel _$YearsModelFromJson(Map<String, dynamic> json) {
  return _YearsModel.fromJson(json);
}

/// @nodoc
class _$YearsModelTearOff {
  const _$YearsModelTearOff();

  _YearsModel call({List<ClassModel> classes = const []}) {
    return _YearsModel(
      classes: classes,
    );
  }

  YearsModel fromJson(Map<String, Object> json) {
    return YearsModel.fromJson(json);
  }
}

/// @nodoc
const $YearsModel = _$YearsModelTearOff();

/// @nodoc
mixin _$YearsModel {
  List<ClassModel> get classes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YearsModelCopyWith<YearsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YearsModelCopyWith<$Res> {
  factory $YearsModelCopyWith(
          YearsModel value, $Res Function(YearsModel) then) =
      _$YearsModelCopyWithImpl<$Res>;
  $Res call({List<ClassModel> classes});
}

/// @nodoc
class _$YearsModelCopyWithImpl<$Res> implements $YearsModelCopyWith<$Res> {
  _$YearsModelCopyWithImpl(this._value, this._then);

  final YearsModel _value;
  // ignore: unused_field
  final $Res Function(YearsModel) _then;

  @override
  $Res call({
    Object? classes = freezed,
  }) {
    return _then(_value.copyWith(
      classes: classes == freezed
          ? _value.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassModel>,
    ));
  }
}

/// @nodoc
abstract class _$YearsModelCopyWith<$Res> implements $YearsModelCopyWith<$Res> {
  factory _$YearsModelCopyWith(
          _YearsModel value, $Res Function(_YearsModel) then) =
      __$YearsModelCopyWithImpl<$Res>;
  @override
  $Res call({List<ClassModel> classes});
}

/// @nodoc
class __$YearsModelCopyWithImpl<$Res> extends _$YearsModelCopyWithImpl<$Res>
    implements _$YearsModelCopyWith<$Res> {
  __$YearsModelCopyWithImpl(
      _YearsModel _value, $Res Function(_YearsModel) _then)
      : super(_value, (v) => _then(v as _YearsModel));

  @override
  _YearsModel get _value => super._value as _YearsModel;

  @override
  $Res call({
    Object? classes = freezed,
  }) {
    return _then(_YearsModel(
      classes: classes == freezed
          ? _value.classes
          : classes // ignore: cast_nullable_to_non_nullable
              as List<ClassModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_YearsModel extends _YearsModel {
  const _$_YearsModel({this.classes = const []}) : super._();

  factory _$_YearsModel.fromJson(Map<String, dynamic> json) =>
      _$$_YearsModelFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<ClassModel> classes;

  @override
  String toString() {
    return 'YearsModel(classes: $classes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _YearsModel &&
            (identical(other.classes, classes) ||
                const DeepCollectionEquality().equals(other.classes, classes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(classes);

  @JsonKey(ignore: true)
  @override
  _$YearsModelCopyWith<_YearsModel> get copyWith =>
      __$YearsModelCopyWithImpl<_YearsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_YearsModelToJson(this);
  }
}

abstract class _YearsModel extends YearsModel {
  const factory _YearsModel({List<ClassModel> classes}) = _$_YearsModel;
  const _YearsModel._() : super._();

  factory _YearsModel.fromJson(Map<String, dynamic> json) =
      _$_YearsModel.fromJson;

  @override
  List<ClassModel> get classes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$YearsModelCopyWith<_YearsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
