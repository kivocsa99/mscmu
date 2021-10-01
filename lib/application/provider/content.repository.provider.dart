import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/i_api_request/content/contracts/i.content.repository.dart';
import '../../domain/i_api_request/failures/api.failures.dart';
import '../../domain/models/contentmodel.dart';
import '../../infrastructure/api_repository/content/services/content.repository.dart';

final contentRepositoryProvider =
    Provider<IContentRepository>((ref) => ContentRepository());
final contentProvider = FutureProvider.autoDispose
    .family<Either<ApiFailures, ContentModel>, int>((ref, id) async {
  final _contentRepository = ref.watch(contentRepositoryProvider);
  return await _contentRepository.getcontent(id);
});
