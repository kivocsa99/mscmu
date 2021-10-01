import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/i.failure.dart';
part 'auth.failures.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure implements IFailure{
const factory AuthFailure.emailAlreadyInUse()=_EmailAlreadyInUse;
const factory AuthFailure.invalidEmail()=_InvalidEmail;
const factory AuthFailure.invalidPassword()=_InvalidPassword;
const factory AuthFailure.serverError()=_ServerError;

 } 