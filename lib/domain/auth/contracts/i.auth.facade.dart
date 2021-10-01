import 'package:dartz/dartz.dart';
import '../failures/auth.failures.dart';

abstract class IAuthFacade{
  Future<Either<AuthFailure, String>> signUpWithEmailAndPassword({
    required String  email,
    required String  password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required String  email,
    required String  password,
  });

  Future<Either<AuthFailure, Unit>> signOut();
  Future<Either<AuthFailure, Unit>> forgotPassword({
    required String  email,
  });

  Stream<String> get currentUserUidStream;
  Stream<bool> get loggedin;
}