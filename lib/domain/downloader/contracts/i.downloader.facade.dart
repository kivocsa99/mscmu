import 'package:dartz/dartz.dart';

import '../failures/downloadfailures.dart';

abstract class IDownloaderFacdae {
  Future<Either<DownloadFailures,Unit>> downloadFile(String url,String filename,String directory);
}
