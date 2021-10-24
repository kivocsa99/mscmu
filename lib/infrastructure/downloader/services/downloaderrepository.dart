
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
      bool waitTask = true;
      while(waitTask) {
        String query = "SELECT * FROM task WHERE task_id='" + id! + "'";
        var _tasks = await FlutterDownloader.loadTasksWithRawQuery(query: query);
        String taskStatus = _tasks![0].status.toString();
        int taskProgress = _tasks[0].progress;
        if(taskStatus == "DownloadTaskStatus(3)" && taskProgress == 100){
          waitTask = false;
        }
      }

      await FlutterDownloader.open(taskId: id!);
      return right(unit);
    } on PlatformException {
      return left(const DownloadFailures.platform());
    }
  }
}
