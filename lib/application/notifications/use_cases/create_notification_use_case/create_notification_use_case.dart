import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mscmu/application/notifications/use_cases/create_notification_.input.dart';
import '../../../core/use_cases/i.use_case.dart';
import '../../../provider/posts.repository.provider.dart';
import '../../../../domain/admin/failures/user.failures.dart';
import '../../../../domain/posts/contracts/i.posts.repository.dart';

final createNotificationUseCaseProvider = Provider((ref) =>
    CreateNotificationUseCase(
        postsRepository: ref.watch(postsRepositoryProvider)));

class CreateNotificationUseCase
    implements IUseCase<CreateNotificationInput, Unit> {
  final IPostsRepository? _postsRepository;

  CreateNotificationUseCase({IPostsRepository? postsRepository})
      : _postsRepository = postsRepository;

  @override
  Future<Either<UserFailures, Unit>> execute(input) async {
    return await _postsRepository!.addNotification(
        title: input.title, yearid: input.yearid);
  }
}
