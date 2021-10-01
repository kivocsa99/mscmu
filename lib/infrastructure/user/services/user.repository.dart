import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/admin/contracts/i.user.repository.dart';
import '../../../domain/admin/failures/user.failures.dart';
import '../../../domain/auth/contracts/i.auth.facade.dart';
import '../../../domain/models/adminmodel.dart';

class UserRepository implements IUserRepository {
  final _firestore = FirebaseFirestore.instance;
  String collection = "admins";

  final IAuthFacade ? _authFacade;

  UserRepository({IAuthFacade? authFacade}) : _authFacade = authFacade;

  @override
  Future<Either<UserFailures, Unit>> save({AdminModel? user}) async {
    try {
      await _firestore.collection(collection).doc(user?.id).set(user!.toJson());
      return right(unit);
    } catch (error) {
      return left(const UserFailures.serverError());
    }
  }

  @override
  Stream<AdminModel> get currentUserStream {
    return Rx.switchLatest(_authFacade!.currentUserUidStream
        .map((uid) => userStream(uid)));
  }

  @override
  Stream<AdminModel> userStream(String uid) {
    final docRef = _firestore.collection(collection).doc(uid);
    final snapshots = docRef.snapshots();
    return snapshots.map((current) => AdminModel.fromJson(current.data()!));
  }

  

}