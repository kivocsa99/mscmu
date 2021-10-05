// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'classmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClassModel _$ClassModelFromJson(Map<String, dynamic> json) {
  return _ClassModel.fromJson(json);
}

/// @nodoc
class _$ClassModelTearOff {
  const _$ClassModelTearOff();

  _ClassModel call({int? id, String? name, bool? isclinical}) {
    return _ClassModel(
      id: id,
      name: name,
      isclinical: isclinical,
    );
  }

  ClassModel fromJson(Map<String, Object> json) {
    return ClassModel.fromJson(json);
  }
}

/// @nodoc
const $ClassModel = _$ClassModelTearOff();

/// @nodoc
mixin _$ClassModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  bool? get isclinical => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassModelCopyWith<ClassModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassModelCopyWith<$Res> {
  factory $ClassModelCopyWith(
          ClassModel value, $Res Function(ClassModel) then) =
      _$ClassModelCopyWithImpl<$Res>;
  $Res call({int? id, String? name, bool? isclinical});
}

/// @nodoc
class _$ClassModelCopyWithImpl<$Res> implements $ClassModelCopyWith<$Res> {
  _$ClassModelCopyWithImpl(this._value, this._then);

  final ClassModel _value;
  // ignore: unused_field
  final $Res Function(ClassModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isclinical = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isclinical: isclinical == freezed
          ? _value.isclinical
          : isclinical // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ClassModelCopyWith<$Res> implements $ClassModelCopyWith<$Res> {
  factory _$ClassModelCopyWith(
          _ClassModel value, $Res Function(_ClassModel) then) =
      __$ClassModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name, bool? isclinical});
}

/// @nodoc
class __$ClassModelCopyWithImpl<$Res> extends _$ClassModelCopyWithImpl<$Res>
    implements _$ClassModelCopyWith<$Res> {
  __$ClassModelCopyWithImpl(
      _ClassModel _value, $Res Function(_ClassModel) _then)
      : super(_value, (v) => _then(v as _ClassModel));

  @override
  _ClassModel get _value => super._value as _ClassModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isclinical = freezed,
  }) {
    return _then(_ClassModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isclinical: isclinical == freezed
          ? _value.isclinical
          : isclinical // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClassModel extends _ClassModel {
  const _$_ClassModel({this.id, this.name, this.isclinical}) : super._();

  factory _$_ClassModel.fromJson(Map<String, dynamic> json) =>
      _$$_ClassModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final bool? isclinical;

  @override
  String toString() {
    return 'ClassModel(id: $id, name: $name, isclinical: $isclinical)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClassModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.isclinical, isclinical) ||
                const DeepCollectionEquality()
                    .equals(other.isclinical, isclinical)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(isclinical);

  @JsonKey(ignore: true)
  @override
  _$ClassModelCopyWith<_ClassModel> get copyWith =>
      __$ClassModelCopyWithImpl<_ClassModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClassModelToJson(this);
  }
}

abstract class _ClassModel extends ClassModel {
  const factory _ClassModel({int? id, String? name, bool? isclinical}) =
      _$_ClassModel;
  const _ClassModel._() : super._();

  factory _ClassModel.fromJson(Map<String, dynamic> json) =
      _$_ClassModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  bool? get isclinical => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ClassModelCopyWith<_ClassModel> get copyWith =>
      throw _privateConstructorUsedError;
}
