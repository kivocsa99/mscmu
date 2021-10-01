// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'downloadfailures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DownloadFailuresTearOff {
  const _$DownloadFailuresTearOff();

  _Platform platform() {
    return const _Platform();
  }
}

/// @nodoc
const $DownloadFailures = _$DownloadFailuresTearOff();

/// @nodoc
mixin _$DownloadFailures {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() platform,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? platform,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? platform,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Platform value) platform,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Platform value)? platform,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Platform value)? platform,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadFailuresCopyWith<$Res> {
  factory $DownloadFailuresCopyWith(
          DownloadFailures value, $Res Function(DownloadFailures) then) =
      _$DownloadFailuresCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadFailuresCopyWithImpl<$Res>
    implements $DownloadFailuresCopyWith<$Res> {
  _$DownloadFailuresCopyWithImpl(this._value, this._then);

  final DownloadFailures _value;
  // ignore: unused_field
  final $Res Function(DownloadFailures) _then;
}

/// @nodoc
abstract class _$PlatformCopyWith<$Res> {
  factory _$PlatformCopyWith(_Platform value, $Res Function(_Platform) then) =
      __$PlatformCopyWithImpl<$Res>;
}

/// @nodoc
class __$PlatformCopyWithImpl<$Res> extends _$DownloadFailuresCopyWithImpl<$Res>
    implements _$PlatformCopyWith<$Res> {
  __$PlatformCopyWithImpl(_Platform _value, $Res Function(_Platform) _then)
      : super(_value, (v) => _then(v as _Platform));

  @override
  _Platform get _value => super._value as _Platform;
}

/// @nodoc

class _$_Platform implements _Platform {
  const _$_Platform();

  @override
  String toString() {
    return 'DownloadFailures.platform()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Platform);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() platform,
  }) {
    return platform();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? platform,
  }) {
    return platform?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? platform,
    required TResult orElse(),
  }) {
    if (platform != null) {
      return platform();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Platform value) platform,
  }) {
    return platform(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Platform value)? platform,
  }) {
    return platform?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Platform value)? platform,
    required TResult orElse(),
  }) {
    if (platform != null) {
      return platform(this);
    }
    return orElse();
  }
}

abstract class _Platform implements DownloadFailures {
  const factory _Platform() = _$_Platform;
}
