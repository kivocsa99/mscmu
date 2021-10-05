import 'package:dartz/dartz.dart';

import '../../../models/mainfoldermodel.dart';
import '../../failures/api.failures.dart';

abstract class IMainFolderRepository {
  Future<Either<ApiFailures, List<MainFolderModel>>> getmainfolders(int id);
}
