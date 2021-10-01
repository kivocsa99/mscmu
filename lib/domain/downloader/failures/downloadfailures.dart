import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/i.failure.dart';
part 'downloadfailures.freezed.dart';

@freezed
abstract class DownloadFailures with _$DownloadFailures implements IFailure{
const factory DownloadFailures.platform()=_Platform;
 } 