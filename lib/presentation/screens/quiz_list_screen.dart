import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/provider/quiz.repository.provider.dart';
import '../../application/provider/sharedpref/pref_provider.dart';
import '../../navigate.dart';
import 'quiz_screen.dart';

class QuizList extends HookWidget {
  const QuizList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = useProvider(sharedPreferences);

    return Scaffold(
      body: SizedBox(
        height: 300,
        child: Column(
          children: [
            prefs.when(
                data: (data) {
                  final yearId = useProvider(prefChangeNotifierProvider).yearId;
                  final quizes = useProvider(allQuizProvider(yearId));
                  return quizes.when(
                      data: (data) {
                        return data.isEmpty
                            ? const Align(
                                alignment: Alignment.center,
                                child: Text(
                                    "Quizes for your class are coming Soon"),
                              )
                            : SizedBox(
                                height: 200,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data.length,
                                    itemBuilder: (context, index) {
                                      final quiz = data[index];
                                      return IconButton(
                                          onPressed: () {
                                            changeScreen(
                                                context,
                                                QuizScreen(
                                                  quizmodel: quiz,
                                                ));
                                          },
                                          icon: const Icon(Icons.star));
                                    }),
                              );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (error, _) {
                        return Center(
                          child: Text("$error"),
                        );
                      });
                },
                loading: () =>const CircularProgressIndicator(),
                error: (error, stack) => Center(
                      child: Text("$error"),
                    )),
          ],
        ),
      ),
    );
  }
}
