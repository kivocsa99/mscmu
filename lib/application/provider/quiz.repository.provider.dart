import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/models/quizmodel.dart';
import '../../domain/quiz/contracts/i.quiz.repository.dart';
import '../../infrastructure/quiz/services/quiz.repository.dart';

final quizRepositoryProvider =
    Provider<IQuizRepository>((ref) => QuizRepository());
final allQuizProvider =
    StreamProvider.autoDispose.family<List<QuizModel>, int>((ref, yearId) {
  final _quizRepository = ref.watch(quizRepositoryProvider);
  return _quizRepository.getquestions(yearId);
});
