import 'package:dartz/dartz.dart';
import '../../admin/failures/user.failures.dart';
import '../../models/postmodel.dart';

abstract class IPostsRepository {
  Stream<List<PostModel>> classPosts(int yearid);
  Future<Either<UserFailures, Unit>> addItem({
    String? title,
    String? adminname,
    String? adminavatar,
    String? image,
    String? body,
    int? yearid,
  });
  Future<Either<UserFailures, Unit>> addNotification({
    String? title,
    int? yearid,
  });
}
