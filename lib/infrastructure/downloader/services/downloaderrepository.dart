
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import '../../../domain/downloader/contracts/i.downloader.facade.dart';
import '../../../domain/downloader/failures/downloadfailures.dart';

class DownloaderRepository implements IDownloaderFacdae {
  @override
  Future<Either<DownloadFailures, Unit>> downloadFile(
      String url, String filename, String directory) async {
    String? id;
    try {
      id = await FlutterDownloader.enqueue(
        url: url,
        savedDir: directory,
        fileName: filename,
        openFileFromNotification: true,
      );
      return right(unit);
    } on PlatformException catch (e) {
      return left(const DownloadFailures.platform());
    }
  }
}
