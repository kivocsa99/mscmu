import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mscmu/application/core/use_cases/i.use_case.dart';
import 'package:mscmu/application/news/use_cases/create_news.input.dart';
import 'package:mscmu/application/provider/news.repository.provider.dart';
import 'package:mscmu/domain/news/contracts/i.news.repository.dart';
import '../../../../domain/admin/failures/user.failures.dart';

final createNewsUseCaseProvider = Provider((ref) =>
    CreateNewsUseCase(
        newsRepository: ref.watch(newsRepositoryProvider)));

class CreateNewsUseCase implements IUseCase<CreateNewsInput, Unit> {
  final INewsRepository? _newsRepository;

  CreateNewsUseCase({INewsRepository? newsRepository})
      : _newsRepository = newsRepository;

  @override
  Future<Either<UserFailures, Unit>> execute(input) async {
    return await _newsRepository!.addNews(
        title: input.title,
        picture: input.picture,
        url: input.url);
  }
}
