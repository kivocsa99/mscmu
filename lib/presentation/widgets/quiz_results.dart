import 'package:flutter/material.dart';
import '../../domain/models/questionmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/models/quizstate.dart';
import '../../application/quiz/controller/quiz.controller.dart';
import 'custom_button.dart';

class QuizResults extends StatelessWidget {
  final QuizState? state;
  final List<QuestionModel>? questions;

  const QuizResults({
    Key? key,
    @required this.state,
    @required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '${state!.correct!.length} / ${questions!.length}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const Text(
          'CORRECT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40.0),
        CustomButton(
          title: 'Go Back to quizes screen',
          onTap: () async {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
