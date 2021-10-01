import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/auth/contracts/i.auth.facade.dart';
import '../../../../domain/auth/failures/auth.failures.dart';
import '../../../core/use_cases/i.use_case.dart';
import '../../../provider/auth.facade.provider.dart';
import 'sign_in_with_email_and_password.input.dart';

final signInWithEmailAndPasswordUseCaseProvider = Provider((ref) =>
    SignInWithEmailAndPasswordUseCase(
        authFacade: ref.watch(authFacadeProvider)));

class SignInWithEmailAndPasswordUseCase
    implements IUseCase<SignInWithEmailAndPasswordUseCaseInput, Unit> {
  final IAuthFacade? _authFacade;

  SignInWithEmailAndPasswordUseCase({IAuthFacade? authFacade})
      : _authFacade = authFacade;

  @override
  Future<Either<AuthFailure, Unit>> execute(input) async {
    return await _authFacade!.signInWithEmailAndPassword(
        email: input.email!, password: input.password!);
  }
}
