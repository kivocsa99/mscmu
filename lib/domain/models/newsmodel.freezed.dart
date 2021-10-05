// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'newsmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return _NewsModel.fromJson(json);
}

/// @nodoc
class _$NewsModelTearOff {
  const _$NewsModelTearOff();

  _NewsModel call({List<String>? title, List<String>? picture}) {
    return _NewsModel(
      title: title,
      picture: picture,
    );
  }

  NewsModel fromJson(Map<String, Object> json) {
    return NewsModel.fromJson(json);
  }
}

/// @nodoc
const $NewsModel = _$NewsModelTearOff();

/// @nodoc
mixin _$NewsModel {
  List<String>? get title => throw _privateConstructorUsedError;
  List<String>? get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsModelCopyWith<NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsModelCopyWith<$Res> {
  factory $NewsModelCopyWith(NewsModel value, $Res Function(NewsModel) then) =
      _$NewsModelCopyWithImpl<$Res>;
  $Res call({List<String>? title, List<String>? picture});
}

/// @nodoc
class _$NewsModelCopyWithImpl<$Res> implements $NewsModelCopyWith<$Res> {
  _$NewsModelCopyWithImpl(this._value, this._then);

  final NewsModel _value;
  // ignore: unused_field
  final $Res Function(NewsModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$NewsModelCopyWith<$Res> implements $NewsModelCopyWith<$Res> {
  factory _$NewsModelCopyWith(
          _NewsModel value, $Res Function(_NewsModel) then) =
      __$NewsModelCopyWithImpl<$Res>;
  @override
  $Res call({List<String>? title, List<String>? picture});
}

/// @nodoc
class __$NewsModelCopyWithImpl<$Res> extends _$NewsModelCopyWithImpl<$Res>
    implements _$NewsModelCopyWith<$Res> {
  __$NewsModelCopyWithImpl(_NewsModel _value, $Res Function(_NewsModel) _then)
      : super(_value, (v) => _then(v as _NewsModel));

  @override
  _NewsModel get _value => super._value as _NewsModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? picture = freezed,
  }) {
    return _then(_NewsModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      picture: picture == freezed
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsModel extends _NewsModel {
  const _$_NewsModel({this.title, this.picture}) : super._();

  factory _$_NewsModel.fromJson(Map<String, dynamic> json) =>
      _$$_NewsModelFromJson(json);

  @override
  final List<String>? title;
  @override
  final List<String>? picture;

  @override
  String toString() {
    return 'NewsModel(title: $title, picture: $picture)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewsModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.picture, picture) ||
                const DeepCollectionEquality().equals(other.picture, picture)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(picture);

  @JsonKey(ignore: true)
  @override
  _$NewsModelCopyWith<_NewsModel> get copyWith =>
      __$NewsModelCopyWithImpl<_NewsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsModelToJson(this);
  }
}

abstract class _NewsModel extends NewsModel {
  const factory _NewsModel({List<String>? title, List<String>? picture}) =
      _$_NewsModel;
  const _NewsModel._() : super._();

  factory _NewsModel.fromJson(Map<String, dynamic> json) =
      _$_NewsModel.fromJson;

  @override
  List<String>? get title => throw _privateConstructorUsedError;
  @override
  List<String>? get picture => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NewsModelCopyWith<_NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
