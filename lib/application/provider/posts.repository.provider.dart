import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/models/postmodel.dart';
import '../../domain/posts/contracts/i.posts.repository.dart';
import '../../infrastructure/posts/services/posts.repository.dart';

final postsRepositoryProvider =
    Provider<IPostsRepository>((ref) => PostsRepository());
final allPostsProvider = StreamProvider.autoDispose.family<List<PostModel>,int>((ref,yearid) {
  final _postRepository = ref.watch(postsRepositoryProvider);
  return _postRepository.classPosts(yearid);
});