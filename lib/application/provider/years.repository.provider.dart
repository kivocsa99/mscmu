import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/years/contracts/i.years.repository.dart';
import '../../infrastructure/years/services/years.repository.dart';
import '../../domain/models/yearmodel.dart';

final yearsRepositoryProvider =
    Provider<IYearsRepository>((ref) => YearsRepository());
final allYearsProvider = StreamProvider.autoDispose<YearsModel>((ref) {
  final _yearsRepository = ref.watch(yearsRepositoryProvider);
  return _yearsRepository.yearsStream;
});