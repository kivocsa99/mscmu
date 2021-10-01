import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/i.failure.dart';


part 'api.failures.freezed.dart';

@freezed
abstract class ApiFailures with _$ApiFailures implements IFailure {
  const factory ApiFailures.serverError() = _ServerError;
    const factory ApiFailures.notFound() = _NotFound;
    const factory ApiFailures.noConnection() = _NoConnection;


}