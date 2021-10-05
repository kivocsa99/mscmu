import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/models/questionmodel.dart';
import '../../domain/models/quizstate.dart';
import '../../application/quiz/controller/quiz.controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/quiz_error.dart';
import '../widgets/quiz_questions.dart';
import '../widgets/quiz_results.dart';

class QuizScreen extends HookWidget {
  final List<QuestionModel>? questions;
  const QuizScreen({this.questions, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quizState = useProvider(quizControllerProvider);
    final pageController = usePageController(initialPage: 0);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff90caf9), Color(0xFF0652C5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          questions != null
              ? Expanded(child: _buildBody(context, pageController, questions!))
              : const QuizError(
                  message: 'Something went wrong!',
                ),
          !quizState.answered
              ? const SizedBox.shrink()
              : CustomButton(
                  title: pageController.page!.toInt() + 1 < questions!.length
                      ? 'Next Question'
                      : 'See Results',
                  onTap: () {
                    context
                        .read(quizControllerProvider.notifier)
                        .nextQuestion(questions!, pageController.page!.toInt());
                    if (pageController.page!.toInt() + 1 < questions!.length) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.linear,
                      );
                    }
                  },
                )
        ]),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    PageController pageController,
    List<QuestionModel> questions,
  ) {
    if (questions.isEmpty) {
      return const QuizError(message: 'No questions found.');
    }

    final quizState = useProvider(quizControllerProvider);
    return quizState.status == QuizStatus.complete
        ? QuizResults(state: quizState, questions: questions)
        : QuizQuestions(
            pageController: pageController,
            state: quizState,
            questions: questions,
          );
  }
}
