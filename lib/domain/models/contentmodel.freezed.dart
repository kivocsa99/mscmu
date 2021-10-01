// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'contentmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) {
  return _ContentModel.fromJson(json);
}

/// @nodoc
class _$ContentModelTearOff {
  const _$ContentModelTearOff();

  _ContentModel call({List<FolderModel>? folders, List<FileModel>? files}) {
    return _ContentModel(
      folders: folders,
      files: files,
    );
  }

  ContentModel fromJson(Map<String, Object> json) {
    return ContentModel.fromJson(json);
  }
}

/// @nodoc
const $ContentModel = _$ContentModelTearOff();

/// @nodoc
mixin _$ContentModel {
  List<FolderModel>? get folders => throw _privateConstructorUsedError;
  List<FileModel>? get files => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentModelCopyWith<ContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentModelCopyWith<$Res> {
  factory $ContentModelCopyWith(
          ContentModel value, $Res Function(ContentModel) then) =
      _$ContentModelCopyWithImpl<$Res>;
  $Res call({List<FolderModel>? folders, List<FileModel>? files});
}

/// @nodoc
class _$ContentModelCopyWithImpl<$Res> implements $ContentModelCopyWith<$Res> {
  _$ContentModelCopyWithImpl(this._value, this._then);

  final ContentModel _value;
  // ignore: unused_field
  final $Res Function(ContentModel) _then;

  @override
  $Res call({
    Object? folders = freezed,
    Object? files = freezed,
  }) {
    return _then(_value.copyWith(
      folders: folders == freezed
          ? _value.folders
          : folders // ignore: cast_nullable_to_non_nullable
              as List<FolderModel>?,
      files: files == freezed
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileModel>?,
    ));
  }
}

/// @nodoc
abstract class _$ContentModelCopyWith<$Res>
    implements $ContentModelCopyWith<$Res> {
  factory _$ContentModelCopyWith(
          _ContentModel value, $Res Function(_ContentModel) then) =
      __$ContentModelCopyWithImpl<$Res>;
  @override
  $Res call({List<FolderModel>? folders, List<FileModel>? files});
}

/// @nodoc
class __$ContentModelCopyWithImpl<$Res> extends _$ContentModelCopyWithImpl<$Res>
    implements _$ContentModelCopyWith<$Res> {
  __$ContentModelCopyWithImpl(
      _ContentModel _value, $Res Function(_ContentModel) _then)
      : super(_value, (v) => _then(v as _ContentModel));

  @override
  _ContentModel get _value => super._value as _ContentModel;

  @override
  $Res call({
    Object? folders = freezed,
    Object? files = freezed,
  }) {
    return _then(_ContentModel(
      folders: folders == freezed
          ? _value.folders
          : folders // ignore: cast_nullable_to_non_nullable
              as List<FolderModel>?,
      files: files == freezed
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<FileModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentModel extends _ContentModel {
  const _$_ContentModel({this.folders, this.files}) : super._();

  factory _$_ContentModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContentModelFromJson(json);

  @override
  final List<FolderModel>? folders;
  @override
  final List<FileModel>? files;

  @override
  String toString() {
    return 'ContentModel(folders: $folders, files: $files)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContentModel &&
            (identical(other.folders, folders) ||
                const DeepCollectionEquality()
                    .equals(other.folders, folders)) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(folders) ^
      const DeepCollectionEquality().hash(files);

  @JsonKey(ignore: true)
  @override
  _$ContentModelCopyWith<_ContentModel> get copyWith =>
      __$ContentModelCopyWithImpl<_ContentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentModelToJson(this);
  }
}

abstract class _ContentModel extends ContentModel {
  const factory _ContentModel(
      {List<FolderModel>? folders, List<FileModel>? files}) = _$_ContentModel;
  const _ContentModel._() : super._();

  factory _ContentModel.fromJson(Map<String, dynamic> json) =
      _$_ContentModel.fromJson;

  @override
  List<FolderModel>? get folders => throw _privateConstructorUsedError;
  @override
  List<FileModel>? get files => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentModelCopyWith<_ContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
