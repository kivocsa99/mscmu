import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/i_api_request/mainfolder/contracts/i.mainfolder.repository.dart';
import '../../domain/models/mainfoldermodel.dart';
import '../../infrastructure/api_repository/mainfolders/services/main.folders.repository.dart';
import '../../domain/i_api_request/failures/api.failures.dart';

final foldersRepositoryProvider =
    Provider<IMainFolderRepository>((ref) => MainFolderRepository());
final mainFoldersProvider = FutureProvider.autoDispose
    .family<Either<ApiFailures, List<MainFolderModel>?>, int>(
        (ref, courseId) async {
  final _mainfoldersRepository = ref.watch(foldersRepositoryProvider);
  return _mainfoldersRepository.getmainfolders(courseId);
});
