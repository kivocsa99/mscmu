import 'package:dartz/dartz.dart';
import '../../failures/api.failures.dart';
import '../../../models/mainfoldermodel.dart';

abstract class IMainFolderRepository {
  Future<Either<ApiFailures, List<MainFolderModel>>> getmainfolders(int id);
}
