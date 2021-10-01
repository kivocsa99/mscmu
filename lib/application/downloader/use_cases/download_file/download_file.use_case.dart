import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/use_cases/i.use_case.dart';
import 'download_file.input.dart';
import '../../../provider/download.repository.provider.dart';
import '../../../../domain/downloader/contracts/i.downloader.facade.dart';
import '../../../../domain/downloader/failures/downloadfailures.dart';

final downloaderUseCaseProvider = Provider((ref) =>
    DownloadFileUseCase(downloaderFacdae: ref.watch(downloaderProider)));

class DownloadFileUseCase implements IUseCase<DownloadFileUseCaseInput, Unit> {
  final IDownloaderFacdae? _downloaderFacdae;

  DownloadFileUseCase({IDownloaderFacdae? downloaderFacdae})
      : _downloaderFacdae = downloaderFacdae;
  @override
  Future<Either<DownloadFailures, Unit>> execute(input) async {
    return await _downloaderFacdae!.downloadFile(input.url!, input.filename!,input.directory!);
  }
}
