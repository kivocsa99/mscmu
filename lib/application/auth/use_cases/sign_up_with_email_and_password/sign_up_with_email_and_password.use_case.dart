import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/auth/contracts/i.auth.facade.dart';
import '../../../../domain/core/i.failure.dart';
import '../../../admin/use_cases/create_admin/create_admin_case.dart';
import '../../../core/use_cases/i.use_case.dart';
import '../../../provider/auth.facade.provider.dart';
import 'sign_up_with_email_and_password.input.dart';


final signUpWithEmailAndPasswordUseCaseProvider = Provider((ref) =>
    SignUpWithEmailAndPasswordUseCase(
        authFacade: ref.watch(authFacadeProvider), read: ref.read));

class SignUpWithEmailAndPasswordUseCase
    implements IUseCase<SignUpWithEmailAndPasswordUseCaseInput, Unit> {
  final IAuthFacade? _authFacade;
  final Reader? _read;

  SignUpWithEmailAndPasswordUseCase({IAuthFacade? authFacade, Reader? read})
      : _authFacade = authFacade,
        _read = read;

  @override
  Future<Either<IFailure, Unit>> execute(input) async {
    final result = await _authFacade!.signUpWithEmailAndPassword(
        email: input.user!.email, password: input.password!);
    return result.fold(
      (failure) => left(failure),
      (uid) =>
          _read!(createAdminCaseProvider).execute(input.user!.copyWith(id: uid)),
    );
  }
}
