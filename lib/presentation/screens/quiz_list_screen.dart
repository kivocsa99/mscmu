import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mscmu/application/quiz/controller/quiz.controller.dart';
import '../../application/provider/quiz.repository.provider.dart';
import '../../application/provider/sharedpref/pref_provider.dart';
import '../../navigate.dart';
import 'quiz_screen.dart';

class QuizListScreen extends HookWidget {
  const QuizListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = useProvider(sharedPreferences);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            prefs.when(
                data: (data) {
                  final yearid = useProvider(prefChangeNotifierProvider).yearId;
                  final quizes = useProvider(allQuizProvider(yearid));
                  return quizes.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      data: (quizes) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () async {
                                context
                                    .read(quizControllerProvider.notifier)
                                    .reset();

                                changeScreen(
                                    context,
                                    QuizScreen(
                                      questions: quizes[index].questions,
                                    ));
                              },
                              leading:
                                  const Icon(FontAwesomeIcons.questionCircle),
                              title: Text(quizes[index].name!),
                            );
                          },
                          itemCount: quizes.length,
                        );
                      });
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, _) => Center(child: Text(error.toString())))
          ],
        ),
      ),
    );
  }
}
