import '../../models/quizmodel.dart';

abstract class IQuizRepository {
  Stream <List<QuizModel>> getquestions(int yearId);
}
