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
  Future<Either<UserFailures, Unit>> editPost({String? id,String? title, String? body});
  Future<Either<UserFailures, Unit>> delete ({String? id});

}
