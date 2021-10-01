// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'foldermodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FolderModel _$FolderModelFromJson(Map<String, dynamic> json) {
  return _FolderModel.fromJson(json);
}

/// @nodoc
class _$FolderModelTearOff {
  const _$FolderModelTearOff();

  _FolderModel call({int? id, String? name}) {
    return _FolderModel(
      id: id,
      name: name,
    );
  }

  FolderModel fromJson(Map<String, Object> json) {
    return FolderModel.fromJson(json);
  }
}

/// @nodoc
const $FolderModel = _$FolderModelTearOff();

/// @nodoc
mixin _$FolderModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FolderModelCopyWith<FolderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderModelCopyWith<$Res> {
  factory $FolderModelCopyWith(
          FolderModel value, $Res Function(FolderModel) then) =
      _$FolderModelCopyWithImpl<$Res>;
  $Res call({int? id, String? name});
}

/// @nodoc
class _$FolderModelCopyWithImpl<$Res> implements $FolderModelCopyWith<$Res> {
  _$FolderModelCopyWithImpl(this._value, this._then);

  final FolderModel _value;
  // ignore: unused_field
  final $Res Function(FolderModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ));
  }
}

/// @nodoc
abstract class _$FolderModelCopyWith<$Res>
    implements $FolderModelCopyWith<$Res> {
  factory _$FolderModelCopyWith(
          _FolderModel value, $Res Function(_FolderModel) then) =
      __$FolderModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name});
}

/// @nodoc
class __$FolderModelCopyWithImpl<$Res> extends _$FolderModelCopyWithImpl<$Res>
    implements _$FolderModelCopyWith<$Res> {
  __$FolderModelCopyWithImpl(
      _FolderModel _value, $Res Function(_FolderModel) _then)
      : super(_value, (v) => _then(v as _FolderModel));

  @override
  _FolderModel get _value => super._value as _FolderModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_FolderModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FolderModel extends _FolderModel {
  const _$_FolderModel({this.id, this.name}) : super._();

  factory _$_FolderModel.fromJson(Map<String, dynamic> json) =>
      _$$_FolderModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'FolderModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FolderModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$FolderModelCopyWith<_FolderModel> get copyWith =>
      __$FolderModelCopyWithImpl<_FolderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FolderModelToJson(this);
  }
}

abstract class _FolderModel extends FolderModel {
  const factory _FolderModel({int? id, String? name}) = _$_FolderModel;
  const _FolderModel._() : super._();

  factory _FolderModel.fromJson(Map<String, dynamic> json) =
      _$_FolderModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FolderModelCopyWith<_FolderModel> get copyWith =>
      throw _privateConstructorUsedError;
}
