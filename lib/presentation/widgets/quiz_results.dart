import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/provider/quiz.repository.provider.dart';
import '../../domain/models/questionmodel.dart';
import '../../infrastructure/quiz/controller/quiz.controller.dart';
import 'custom_button.dart';

class QuizResults extends HookWidget {
  final List<QuestionModel>? questions;

  final quizState = useProvider(quizControllerProvider);

  QuizResults({Key? key, required this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '$quizState',
          style:const TextStyle(
              color: Colors.white, fontSize: 60.0, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const Text(
          'YAAY! WANNNA GO AGAIN?',
          style: TextStyle(
              color: Colors.white, fontSize: 45.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 40.0,
        ),
        CustomButton(
            title: 'New Quiz',
            onTap: () {
              context.refresh(quizRepositoryProvider);
              context.read(quizControllerProvider.notifier).reset();
            })
      ],
    );
  }
}
