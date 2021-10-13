import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/models/newsmodel.dart';
import '../../domain/news/contracts/i.news.repository.dart';
import '../../infrastructure/news/services/news.repository.dart';

final newsRepositoryProvider = Provider<INewsRepository>((ref) => NewsRepository());
final allNewsProvider = StreamProvider.autoDispose <List<NewsModel>?>((ref) {
  final _newsRepository = ref.watch(newsRepositoryProvider);
  return _newsRepository.newsStream;
});
