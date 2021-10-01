import 'package:dartz/dartz.dart';
import '../../models/adminmodel.dart';
import '../failures/user.failures.dart';

abstract class IUserRepository {
  Future<Either<UserFailures, Unit>> save({
    required AdminModel user,
  });


  Stream<AdminModel> get currentUserStream;
  Stream<AdminModel> userStream(String uid);
}