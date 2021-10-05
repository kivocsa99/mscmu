import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/models/quizmodel.dart';
import '../../../domain/quiz/contracts/i.quiz.repository.dart';

class QuizRepository implements IQuizRepository {
  final _firestore = FirebaseFirestore.instance;
  static const String quizcollection = "quizes";

  @override
  Stream<List<QuizModel>> getquestions(int yearId) {
    return _firestore
        .collection(quizcollection)
        .where("yearid", isEqualTo: yearId)
        .snapshots()
        .map(
          (event) => event.docs
              .map(
                (e) => QuizModel.fromJson(
                  e.data(),
                ),
              )
              .toList(),
        );
  }
}
