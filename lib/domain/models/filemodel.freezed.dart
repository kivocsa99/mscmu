// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filemodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileModel _$FileModelFromJson(Map<String, dynamic> json) {
  return _FileModel.fromJson(json);
}

/// @nodoc
class _$FileModelTearOff {
  const _$FileModelTearOff();

  _FileModel call(
      {int? id,
      String? name,
      String? url,
      String? out_link,
      int? number_downloads}) {
    return _FileModel(
      id: id,
      name: name,
      url: url,
      out_link: out_link,
      number_downloads: number_downloads,
    );
  }

  FileModel fromJson(Map<String, Object> json) {
    return FileModel.fromJson(json);
  }
}

/// @nodoc
const $FileModel = _$FileModelTearOff();

/// @nodoc
mixin _$FileModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get out_link => throw _privateConstructorUsedError;
  int? get number_downloads => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileModelCopyWith<FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileModelCopyWith<$Res> {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) then) =
      _$FileModelCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String? name,
      String? url,
      String? out_link,
      int? number_downloads});
}

/// @nodoc
class _$FileModelCopyWithImpl<$Res> implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._value, this._then);

  final FileModel _value;
  // ignore: unused_field
  final $Res Function(FileModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? out_link = freezed,
    Object? number_downloads = freezed,
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
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      out_link: out_link == freezed
          ? _value.out_link
          : out_link // ignore: cast_nullable_to_non_nullable
              as String?,
      number_downloads: number_downloads == freezed
          ? _value.number_downloads
          : number_downloads // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$FileModelCopyWith<$Res> implements $FileModelCopyWith<$Res> {
  factory _$FileModelCopyWith(
          _FileModel value, $Res Function(_FileModel) then) =
      __$FileModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String? name,
      String? url,
      String? out_link,
      int? number_downloads});
}

/// @nodoc
class __$FileModelCopyWithImpl<$Res> extends _$FileModelCopyWithImpl<$Res>
    implements _$FileModelCopyWith<$Res> {
  __$FileModelCopyWithImpl(_FileModel _value, $Res Function(_FileModel) _then)
      : super(_value, (v) => _then(v as _FileModel));

  @override
  _FileModel get _value => super._value as _FileModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? url = freezed,
    Object? out_link = freezed,
    Object? number_downloads = freezed,
  }) {
    return _then(_FileModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      out_link: out_link == freezed
          ? _value.out_link
          : out_link // ignore: cast_nullable_to_non_nullable
              as String?,
      number_downloads: number_downloads == freezed
          ? _value.number_downloads
          : number_downloads // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileModel extends _FileModel {
  const _$_FileModel(
      {this.id, this.name, this.url, this.out_link, this.number_downloads})
      : super._();

  factory _$_FileModel.fromJson(Map<String, dynamic> json) =>
      _$$_FileModelFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? url;
  @override
  final String? out_link;
  @override
  final int? number_downloads;

  @override
  String toString() {
    return 'FileModel(id: $id, name: $name, url: $url, out_link: $out_link, number_downloads: $number_downloads)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FileModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.out_link, out_link) ||
                const DeepCollectionEquality()
                    .equals(other.out_link, out_link)) &&
            (identical(other.number_downloads, number_downloads) ||
                const DeepCollectionEquality()
                    .equals(other.number_downloads, number_downloads)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(out_link) ^
      const DeepCollectionEquality().hash(number_downloads);

  @JsonKey(ignore: true)
  @override
  _$FileModelCopyWith<_FileModel> get copyWith =>
      __$FileModelCopyWithImpl<_FileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileModelToJson(this);
  }
}

abstract class _FileModel extends FileModel {
  const factory _FileModel(
      {int? id,
      String? name,
      String? url,
      String? out_link,
      int? number_downloads}) = _$_FileModel;
  const _FileModel._() : super._();

  factory _FileModel.fromJson(Map<String, dynamic> json) =
      _$_FileModel.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  String? get out_link => throw _privateConstructorUsedError;
  @override
  int? get number_downloads => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FileModelCopyWith<_FileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
