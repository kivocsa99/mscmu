import 'package:dartz/dartz.dart';
import 'package:mscmu/domain/admin/failures/user.failures.dart';

import '../../models/newsmodel.dart';

abstract class INewsRepository {
  Stream<List<NewsModel>> get newsStream;
  Future<Either<UserFailures, Unit>> addNews({
    String? title,
    String? picture,
    String? url,
  });
}
