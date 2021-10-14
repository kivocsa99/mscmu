import 'package:dartz/dartz.dart';
import 'package:mscmu/domain/models/adminmodel.dart';
import '../failures/auth.failures.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, String>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
  Future<Either<AuthFailure, Unit>> forgotPassword({
    required String email,
  });

  Stream<String> get currentUserUidStream;
}
