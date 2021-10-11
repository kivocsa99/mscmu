// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notificationmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) {
  return _NotificationsModel.fromJson(json);
}

/// @nodoc
class _$NotificationsModelTearOff {
  const _$NotificationsModelTearOff();

  _NotificationsModel call({List<String>? title, List<String>? yearid}) {
    return _NotificationsModel(
      title: title,
      yearid: yearid,
    );
  }

  NotificationsModel fromJson(Map<String, Object> json) {
    return NotificationsModel.fromJson(json);
  }
}

/// @nodoc
const $NotificationsModel = _$NotificationsModelTearOff();

/// @nodoc
mixin _$NotificationsModel {
  List<String>? get title => throw _privateConstructorUsedError;
  List<String>? get yearid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationsModelCopyWith<NotificationsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsModelCopyWith<$Res> {
  factory $NotificationsModelCopyWith(
          NotificationsModel value, $Res Function(NotificationsModel) then) =
      _$NotificationsModelCopyWithImpl<$Res>;
  $Res call({List<String>? title, List<String>? yearid});
}

/// @nodoc
class _$NotificationsModelCopyWithImpl<$Res>
    implements $NotificationsModelCopyWith<$Res> {
  _$NotificationsModelCopyWithImpl(this._value, this._then);

  final NotificationsModel _value;
  // ignore: unused_field
  final $Res Function(NotificationsModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? yearid = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      yearid: yearid == freezed
          ? _value.yearid
          : yearid // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$NotificationsModelCopyWith<$Res>
    implements $NotificationsModelCopyWith<$Res> {
  factory _$NotificationsModelCopyWith(
          _NotificationsModel value, $Res Function(_NotificationsModel) then) =
      __$NotificationsModelCopyWithImpl<$Res>;
  @override
  $Res call({List<String>? title, List<String>? yearid});
}

/// @nodoc
class __$NotificationsModelCopyWithImpl<$Res>
    extends _$NotificationsModelCopyWithImpl<$Res>
    implements _$NotificationsModelCopyWith<$Res> {
  __$NotificationsModelCopyWithImpl(
      _NotificationsModel _value, $Res Function(_NotificationsModel) _then)
      : super(_value, (v) => _then(v as _NotificationsModel));

  @override
  _NotificationsModel get _value => super._value as _NotificationsModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? yearid = freezed,
  }) {
    return _then(_NotificationsModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      yearid: yearid == freezed
          ? _value.yearid
          : yearid // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationsModel extends _NotificationsModel {
  const _$_NotificationsModel({this.title, this.yearid}) : super._();

  factory _$_NotificationsModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationsModelFromJson(json);

  @override
  final List<String>? title;
  @override
  final List<String>? yearid;

  @override
  String toString() {
    return 'NotificationsModel(title: $title, yearid: $yearid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NotificationsModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.yearid, yearid) ||
                const DeepCollectionEquality().equals(other.yearid, yearid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(yearid);

  @JsonKey(ignore: true)
  @override
  _$NotificationsModelCopyWith<_NotificationsModel> get copyWith =>
      __$NotificationsModelCopyWithImpl<_NotificationsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationsModelToJson(this);
  }
}

abstract class _NotificationsModel extends NotificationsModel {
  const factory _NotificationsModel(
      {List<String>? title, List<String>? yearid}) = _$_NotificationsModel;
  const _NotificationsModel._() : super._();

  factory _NotificationsModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationsModel.fromJson;

  @override
  List<String>? get title => throw _privateConstructorUsedError;
  @override
  List<String>? get yearid => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NotificationsModelCopyWith<_NotificationsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
