import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/downloader/contracts/i.downloader.facade.dart';
import '../../infrastructure/downloader/services/downloaderrepository.dart';

final downloaderProider= Provider<IDownloaderFacdae>((ref) => DownloaderRepository());