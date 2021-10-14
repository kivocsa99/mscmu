import 'package:dartz/dartz.dart';
import '../../models/adminmodel.dart';
import '../failures/user.failures.dart';

abstract class IUserRepository {
  Future<Either<UserFailures, Unit>> save({
    required AdminModel user,
  });

  Stream<AdminModel> get currentUserStream;
  Stream<List<AdminModel>> get allUsers;
  Stream<AdminModel> userStream(String uid);
  Future<void> acceptedAdmin(String uid);
  Future<void> unacceptAdmin(String uid);

}
