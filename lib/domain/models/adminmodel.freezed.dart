// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'adminmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdminModel _$AdminModelFromJson(Map<String, dynamic> json) {
  return _AdminModel.fromJson(json);
}

/// @nodoc
class _$AdminModelTearOff {
  const _$AdminModelTearOff();

  _AdminModel call(
      {String? id,
      String? name,
      String? email,
      String avatar =
          "https://drive.google.com/file/d/1_IEGfDil4sTy-lpwnLSsSgNtE28E05dn/view?usp=sharing",
      int? yearid,
      bool? accepted = false,
      bool? fulladmin = false}) {
    return _AdminModel(
      id: id,
      name: name,
      email: email,
      avatar: avatar,
      yearid: yearid,
      accepted: accepted,
      fulladmin: fulladmin,
    );
  }

  AdminModel fromJson(Map<String, Object> json) {
    return AdminModel.fromJson(json);
  }
}

/// @nodoc
const $AdminModel = _$AdminModelTearOff();

/// @nodoc
mixin _$AdminModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  int? get yearid => throw _privateConstructorUsedError;
  bool? get accepted => throw _privateConstructorUsedError;
  bool? get fulladmin => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminModelCopyWith<AdminModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminModelCopyWith<$Res> {
  factory $AdminModelCopyWith(
          AdminModel value, $Res Function(AdminModel) then) =
      _$AdminModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? name,
      String? email,
      String avatar,
      int? yearid,
      bool? accepted,
      bool? fulladmin});
}

/// @nodoc
class _$AdminModelCopyWithImpl<$Res> implements $AdminModelCopyWith<$Res> {
  _$AdminModelCopyWithImpl(this._value, this._then);

  final AdminModel _value;
  // ignore: unused_field
  final $Res Function(AdminModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? yearid = freezed,
    Object? accepted = freezed,
    Object? fulladmin = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      yearid: yearid == freezed
          ? _value.yearid
          : yearid // ignore: cast_nullable_to_non_nullable
              as int?,
      accepted: accepted == freezed
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      fulladmin: fulladmin == freezed
          ? _value.fulladmin
          : fulladmin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$AdminModelCopyWith<$Res> implements $AdminModelCopyWith<$Res> {
  factory _$AdminModelCopyWith(
          _AdminModel value, $Res Function(_AdminModel) then) =
      __$AdminModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      String? email,
      String avatar,
      int? yearid,
      bool? accepted,
      bool? fulladmin});
}

/// @nodoc
class __$AdminModelCopyWithImpl<$Res> extends _$AdminModelCopyWithImpl<$Res>
    implements _$AdminModelCopyWith<$Res> {
  __$AdminModelCopyWithImpl(
      _AdminModel _value, $Res Function(_AdminModel) _then)
      : super(_value, (v) => _then(v as _AdminModel));

  @override
  _AdminModel get _value => super._value as _AdminModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? yearid = freezed,
    Object? accepted = freezed,
    Object? fulladmin = freezed,
  }) {
    return _then(_AdminModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      yearid: yearid == freezed
          ? _value.yearid
          : yearid // ignore: cast_nullable_to_non_nullable
              as int?,
      accepted: accepted == freezed
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      fulladmin: fulladmin == freezed
          ? _value.fulladmin
          : fulladmin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdminModel extends _AdminModel {
  const _$_AdminModel(
      {this.id,
      this.name,
      this.email,
      this.avatar =
          "https://drive.google.com/file/d/1_IEGfDil4sTy-lpwnLSsSgNtE28E05dn/view?usp=sharing",
      this.yearid,
      this.accepted = false,
      this.fulladmin = false})
      : super._();

  factory _$_AdminModel.fromJson(Map<String, dynamic> json) =>
      _$$_AdminModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? email;
  @JsonKey(
      defaultValue:
          "https://drive.google.com/file/d/1_IEGfDil4sTy-lpwnLSsSgNtE28E05dn/view?usp=sharing")
  @override
  final String avatar;
  @override
  final int? yearid;
  @JsonKey(defaultValue: false)
  @override
  final bool? accepted;
  @JsonKey(defaultValue: false)
  @override
  final bool? fulladmin;

  @override
  String toString() {
    return 'AdminModel(id: $id, name: $name, email: $email, avatar: $avatar, yearid: $yearid, accepted: $accepted, fulladmin: $fulladmin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AdminModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)) &&
            (identical(other.yearid, yearid) ||
                const DeepCollectionEquality().equals(other.yearid, yearid)) &&
            (identical(other.accepted, accepted) ||
                const DeepCollectionEquality()
                    .equals(other.accepted, accepted)) &&
            (identical(other.fulladmin, fulladmin) ||
                const DeepCollectionEquality()
                    .equals(other.fulladmin, fulladmin)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(avatar) ^
      const DeepCollectionEquality().hash(yearid) ^
      const DeepCollectionEquality().hash(accepted) ^
      const DeepCollectionEquality().hash(fulladmin);

  @JsonKey(ignore: true)
  @override
  _$AdminModelCopyWith<_AdminModel> get copyWith =>
      __$AdminModelCopyWithImpl<_AdminModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdminModelToJson(this);
  }
}

abstract class _AdminModel extends AdminModel {
  const factory _AdminModel(
      {String? id,
      String? name,
      String? email,
      String avatar,
      int? yearid,
      bool? accepted,
      bool? fulladmin}) = _$_AdminModel;
  const _AdminModel._() : super._();

  factory _AdminModel.fromJson(Map<String, dynamic> json) =
      _$_AdminModel.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String get avatar => throw _privateConstructorUsedError;
  @override
  int? get yearid => throw _privateConstructorUsedError;
  @override
  bool? get accepted => throw _privateConstructorUsedError;
  @override
  bool? get fulladmin => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AdminModelCopyWith<_AdminModel> get copyWith =>
      throw _privateConstructorUsedError;
}
