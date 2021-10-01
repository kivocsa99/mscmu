// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'coursemodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) {
  return _CourseModel.fromJson(json);
}

/// @nodoc
class _$CourseModelTearOff {
  const _$CourseModelTearOff();

  _CourseModel call({int? id, String? icon, String? name}) {
    return _CourseModel(
      id: id,
      icon: icon,
      name: name,
    );
  }

  CourseModel fromJson(Map<String, Object> json) {
    return CourseModel.fromJson(json);
  }
}

/// @nodoc
const $CourseModel = _$CourseModelTearOff();

/// @nodoc
mixin _$CourseModel {
  int? get id => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseModelCopyWith<CourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseModelCopyWith<$Res> {
  factory $CourseModelCopyWith(
          CourseModel value, $Res Function(CourseModel) then) =
      _$CourseModelCopyWithImpl<$Res>;
  $Res call({int? id, String? icon, String? name});
}

/// @nodoc
class _$CourseModelCopyWithImpl<$Res> implements $CourseModelCopyWith<$Res> {
  _$CourseModelCopyWithImpl(this._value, this._then);

  final CourseModel _value;
  // ignore: unused_field
  final $Res Function(CourseModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? icon = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CourseModelCopyWith<$Res>
    implements $CourseModelCopyWith<$Res> {
  factory _$CourseModelCopyWith(
          _CourseModel value, $Res Function(_CourseModel) then) =
      __$CourseModelCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? icon, String? name});
}

/// @nodoc
class __$CourseModelCopyWithImpl<$Res> extends _$CourseModelCopyWithImpl<$Res>
    implements _$CourseModelCopyWith<$Res> {
  __$CourseModelCopyWithImpl(
      _CourseModel _value, $Res Function(_CourseModel) _then)
      : super(_value, (v) => _then(v as _CourseModel));

  @override
  _CourseModel get _value => super._value as _CourseModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? icon = freezed,
    Object? name = freezed,
  }) {
    return _then(_CourseModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CourseModel extends _CourseModel {
  const _$_CourseModel({this.id, this.icon, this.name}) : super._();

  factory _$_CourseModel.fromJson(Map<String, dynamic> json) =>
      _$$_CourseModelFromJson(json);

  @override
  final int? id;
  @override
  final String? icon;
  @override
  final String? name;

  @override
  String toString() {
    return 'CourseModel(id: $id, icon: $icon, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CourseModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$CourseModelCopyWith<_CourseModel> get copyWith =>
      __$CourseModelCopyWithImpl<_CourseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CourseModelToJson(this);
  }
}

abstract class _CourseModel extends CourseModel {
  const factory _CourseModel({int? id, String? icon, String? name}) =
      _$_CourseModel;
  const _CourseModel._() : super._();

  factory _CourseModel.fromJson(Map<String, dynamic> json) =
      _$_CourseModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get icon => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CourseModelCopyWith<_CourseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
