import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/core/i.failure.dart';


part 'user.failures.freezed.dart';

@freezed
abstract class UserFailures with _$UserFailures implements IFailure {
  const factory UserFailures.docNotFound() = _DocNotFound;
  const factory UserFailures.serverError() = _ServerError;
}