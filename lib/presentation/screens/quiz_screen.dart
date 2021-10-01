import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../domain/models/quizmodel.dart';
import '../../infrastructure/quiz/controller/quiz.controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/quiz_body.dart';
import '../widgets/quiz_error.dart';

class QuizScreen extends HookWidget {
  final QuizModel? quizmodel;

  const QuizScreen({Key? key, this.quizmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();

    final quizState = useProvider(quizControllerProvider);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration:const BoxDecoration(
        gradient:  LinearGradient(
            colors: [Color(0xFFD4418E), Color(0xff0652C5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BuildBody(
              pageController: pageController, questions: quizmodel!.questions!),
          bottomSheet: !quizState.answered == true
              ? const SizedBox.shrink()
              : CustomButton(
                  title: pageController.page!.toInt() + 1 <
                          quizmodel!.questions!.length
                      ? 'Next Questions'
                      : 'See Results',
                  onTap: () {
                    context.read(quizControllerProvider.notifier).nextQuestion(
                        quizmodel!.questions!, pageController.page!.toInt());

                    if (pageController.page!.toInt() + 1 <
                        quizmodel!.questions!.length) {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.linear);
                    }
                  })),
    );
  }
}
