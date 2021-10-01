// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'postmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
class _$PostModelTearOff {
  const _$PostModelTearOff();

  _PostModel call(
      {int? yearid,
      String? title,
      String? body,
      String? adminavatar,
      String? adminname,
      String? time,
      String? image}) {
    return _PostModel(
      yearid: yearid,
      title: title,
      body: body,
      adminavatar: adminavatar,
      adminname: adminname,
      time: time,
      image: image,
    );
  }

  PostModel fromJson(Map<String, Object> json) {
    return PostModel.fromJson(json);
  }
}

/// @nodoc
const $PostModel = _$PostModelTearOff();

/// @nodoc
mixin _$PostModel {
  int? get yearid => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get adminavatar => throw _privateConstructorUsedError;
  String? get adminname => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res>;
  $Res call(
      {int? yearid,
      String? title,
      String? body,
      String? adminavatar,
      String? adminname,
      String? time,
      String? image});
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res> implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  final PostModel _value;
  // ignore: unused_field
  final $Res Function(PostModel) _then;

  @override
  $Res call({
    Object? yearid = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? adminavatar = freezed,
    Object? adminname = freezed,
    Object? time = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      yearid: yearid == freezed
          ? _value.yearid
          : yearid // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      adminavatar: adminavatar == freezed
          ? _value.adminavatar
          : adminavatar // ignore: cast_nullable_to_non_nullable
              as String?,
      adminname: adminname == freezed
          ? _value.adminname
          : adminname // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(
          _PostModel value, $Res Function(_PostModel) then) =
      __$PostModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? yearid,
      String? title,
      String? body,
      String? adminavatar,
      String? adminname,
      String? time,
      String? image});
}

/// @nodoc
class __$PostModelCopyWithImpl<$Res> extends _$PostModelCopyWithImpl<$Res>
    implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(_PostModel _value, $Res Function(_PostModel) _then)
      : super(_value, (v) => _then(v as _PostModel));

  @override
  _PostModel get _value => super._value as _PostModel;

  @override
  $Res call({
    Object? yearid = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? adminavatar = freezed,
    Object? adminname = freezed,
    Object? time = freezed,
    Object? image = freezed,
  }) {
    return _then(_PostModel(
      yearid: yearid == freezed
          ? _value.yearid
          : yearid // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      adminavatar: adminavatar == freezed
          ? _value.adminavatar
          : adminavatar // ignore: cast_nullable_to_non_nullable
              as String?,
      adminname: adminname == freezed
          ? _value.adminname
          : adminname // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostModel extends _PostModel {
  const _$_PostModel(
      {this.yearid,
      this.title,
      this.body,
      this.adminavatar,
      this.adminname,
      this.time,
      this.image})
      : super._();

  factory _$_PostModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostModelFromJson(json);

  @override
  final int? yearid;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? adminavatar;
  @override
  final String? adminname;
  @override
  final String? time;
  @override
  final String? image;

  @override
  String toString() {
    return 'PostModel(yearid: $yearid, title: $title, body: $body, adminavatar: $adminavatar, adminname: $adminname, time: $time, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostModel &&
            (identical(other.yearid, yearid) ||
                const DeepCollectionEquality().equals(other.yearid, yearid)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.adminavatar, adminavatar) ||
                const DeepCollectionEquality()
                    .equals(other.adminavatar, adminavatar)) &&
            (identical(other.adminname, adminname) ||
                const DeepCollectionEquality()
                    .equals(other.adminname, adminname)) &&
            (identical(other.time, time) ||
                const DeepCollectionEquality().equals(other.time, time)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(yearid) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(adminavatar) ^
      const DeepCollectionEquality().hash(adminname) ^
      const DeepCollectionEquality().hash(time) ^
      const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$PostModelCopyWith<_PostModel> get copyWith =>
      __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostModelToJson(this);
  }
}

abstract class _PostModel extends PostModel {
  const factory _PostModel(
      {int? yearid,
      String? title,
      String? body,
      String? adminavatar,
      String? adminname,
      String? time,
      String? image}) = _$_PostModel;
  const _PostModel._() : super._();

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$_PostModel.fromJson;

  @override
  int? get yearid => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get body => throw _privateConstructorUsedError;
  @override
  String? get adminavatar => throw _privateConstructorUsedError;
  @override
  String? get adminname => throw _privateConstructorUsedError;
  @override
  String? get time => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostModelCopyWith<_PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}
