import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mscmu/application/core/use_cases/i.use_case.dart';
import 'package:mscmu/application/posts/use_cases/edit_post/edit_post_input.dart';
import 'package:mscmu/application/provider/posts.repository.provider.dart';
import 'package:mscmu/domain/core/i.failure.dart';
import 'package:mscmu/domain/posts/contracts/i.posts.repository.dart';

final editPostProvider = Provider((ref) =>
    EditPostUseCase(postsRepository: ref.watch(postsRepositoryProvider)));

class EditPostUseCase implements IUseCase<EditPostInput, Unit> {
  final IPostsRepository? iPostsRepository;

  EditPostUseCase({IPostsRepository? postsRepository})
      : iPostsRepository = postsRepository;

  @override
  Future<Either<IFailure, Unit>> execute(input) async {
    return await iPostsRepository!
        .editPost(id: input.id, title: input.title, body: input.body);
  }
}
