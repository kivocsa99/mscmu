
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/models/questionmodel.dart';
import '../../domain/models/quizstate.dart';
import '../../infrastructure/quiz/controller/quiz.controller.dart';
import 'quiz_error.dart';
import 'quiz_questions.dart';
import 'quiz_results.dart';

class BuildBody extends HookWidget {
  final PageController pageController;
  final List<QuestionModel> questions;

  BuildBody({Key? key, required this.pageController, required this.questions}) : super(key: key);

  final quizState = useProvider(quizControllerProvider);

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) return const QuizError(message: 'No Questions found');
    return quizState.status == QuizStatus.complete
        ? QuizResults(questions: questions)
        : QuizQuestions(
            pageController: pageController,
            state: quizState,
            questions: questions);
  }
}
