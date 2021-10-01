import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/models/questionmodel.dart';
import '../../domain/models/quizstate.dart';
import '../../infrastructure/quiz/controller/quiz.controller.dart';
import 'quiz_answer_card.dart';

class QuizQuestions extends StatelessWidget {
  final PageController pageController;
  final QuizState state;
  final List<QuestionModel> questions;

  const QuizQuestions(
      {Key? key,
      required this.pageController,
      required this.state,
      required this.questions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PageView.builder(
          controller: pageController,
          itemCount: questions.length,
          itemBuilder: (BuildContext context, int index) {
            final question = questions[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Question ${index + 1} of ${questions.length}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    question.question,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Divider(
                  color: Colors.grey[200],
                  height: 32.0,
                  thickness: 2.0,
                  indent: 20.0,
                  endIndent: 20.0,
                ),
                Column(
                  children: question.answers
                      .map((e) => AnswerCard(
                          answer: e,
                          isSelected: e == state.selectedAnswer,
                          isCorrect: e == question.correct,
                          isDisplayingAnswer: state.answered,
                          onTap: () => context
                              .read(quizControllerProvider.notifier)
                              .submitAnswer(question, e)))
                      .toList(),
                )
              ],
            );
          }),
    );
  }
}
