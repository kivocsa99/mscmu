import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/use_cases/i.use_case.dart';
import 'create_post_input.dart';
import '../../../provider/posts.repository.provider.dart';
import '../../../../domain/admin/failures/user.failures.dart';
import '../../../../domain/posts/contracts/i.posts.repository.dart';

final createpostUseCaseProvider = Provider((ref) =>
    CreatePostUseCase(postsRepository: ref.watch(postsRepositoryProvider)));

class CreatePostUseCase implements IUseCase<CreatepostInput, Unit> {
  final IPostsRepository? _postsRepository;

  CreatePostUseCase({IPostsRepository? postsRepository})
      : _postsRepository = postsRepository;

  @override
  Future<Either<UserFailures, Unit>> execute(input) async {
    return await _postsRepository!.addItem(
        title: input.title,
        body: input.body,
        image: input.image,
        adminavatar: input.adminavatar,
        adminname: input.adminname,
        yearid: input.yearid);
  }
}
