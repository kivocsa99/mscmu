import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/admin/contracts/i.user.repository.dart';
import 'auth.facade.provider.dart';
import '../../infrastructure/user/services/user.repository.dart';

final adminRepositoryProvider = Provider<IUserRepository>(
    (ref) => UserRepository(authFacade: ref.watch(authFacadeProvider)));
