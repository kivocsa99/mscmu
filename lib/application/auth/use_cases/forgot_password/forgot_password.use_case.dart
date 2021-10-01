import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../provider/auth.facade.provider.dart';

import '../../../../domain/auth/contracts/i.auth.facade.dart';
import '../../../../domain/core/i.failure.dart';
import '../../../core/use_cases/i.use_case.dart';
import 'forgot_password.input.dart';

final forgotPasswordUseCaseProvider = Provider(
    (ref) => ForgotPasswordUseCase(authFacade: ref.watch(authFacadeProvider)));

class ForgotPasswordUseCase
    implements IUseCase<ForgotPasswordUseCaseInput, Unit> {
  final IAuthFacade? _authFacade;
  ForgotPasswordUseCase({IAuthFacade? authFacade}) : _authFacade = authFacade;

  @override
  Future<Either<IFailure, Unit>> execute(input) async {
    return await _authFacade!.forgotPassword(email: input.email!);
  }
}
