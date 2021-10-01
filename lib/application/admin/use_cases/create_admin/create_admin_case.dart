import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/admin/contracts/i.user.repository.dart';
import '../../../../domain/core/i.failure.dart';
import '../../../../domain/models/adminmodel.dart';
import '../../../core/use_cases/i.use_case.dart';
import '../../../provider/user.repository.provider.dart';

final createAdminCaseProvider = Provider((ref) =>
    CreateUserUseCase(userRepository: ref.watch(adminRepositoryProvider)));

class CreateUserUseCase implements IUseCase<AdminModel, Unit> {
  final IUserRepository? _userRepository;
  CreateUserUseCase({IUserRepository? userRepository})
      : _userRepository = userRepository;
  @override
  Future<Either<IFailure, Unit>> execute(input) {
    return _userRepository!.save(user: input);
  }
}