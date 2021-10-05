import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/models/questionmodel.dart';
import '../../domain/models/quizstate.dart';
import '../../application/quiz/controller/quiz.controller.dart';
import 'quiz_answer_card.dart';

class QuizQuestions extends StatelessWidget {
  final PageController? pageController;
  final QuizState? state;
  final List<QuestionModel>? questions;

  const QuizQuestions({
    Key? key,
    @required this.pageController,
    @required this.state,
    @required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions!.length,
      itemBuilder: (BuildContext context, int index) {
        final question = questions![index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${index + 1} of ${questions!.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 12.0),
              child: Text(
                question.question!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Divider(
              color: Colors.grey[200],
              height: 0.0,
              thickness: 2.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AnswerCard(
                    answer: question.answers![index],
                    isSelected:
                        question.answers![index] == state!.selectedAnswer,
                    isCorrect: question.answers![index] == question.correct,
                    isDisplayingAnswer: state!.answered,
                    onTap: () async {
                      context
                          .read(quizControllerProvider.notifier)
                          .submitAnswer(question, question.answers![index]);
                    });
              },
              itemCount: question.answers!.length,
            ),
          ],
        );
      },
    );
  }
}
