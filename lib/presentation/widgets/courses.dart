import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../application/provider/courses.repository.provider.dart';
import '../../application/provider/sharedpref/pref_provider.dart';
import '../../navigate.dart';
import '../screens/mainfolders_screen.dart';
import 'shimmer_affect.dart';

class Courses extends HookWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prefs = useProvider(sharedPreferences);
    return SingleChildScrollView(
      child: Column(
        children: [
         const SizedBox(
            height: 30,
          ),
          prefs.when(
              data: (data) {
                final yearId = useProvider(prefChangeNotifierProvider).yearId;
                final yearId2 = useProvider(prefChangeNotifierProvider).yearId2;
                final posts = useProvider(
                    activeCourseProvider(yearId2 == 1 ? yearId : yearId2));
                return posts.when(
                    data: (data) => data.fold(
                          (l) => Center(child: Text(l.toString())),
                          (r) => GridView.builder(
                            itemCount: r.length,
                            physics:const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemBuilder: (BuildContext ctx, index) {
                              return InkWell(
                                onTap: () {
                                  changeScreen(context,
                                      MainFoldersScreen(id: r[index].id));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.network(r[index].icon!),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    Text(r[index].name!)
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                    loading: () => GridView.builder(
                          itemCount: 10,
                          physics:const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                             const  SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,              

                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemBuilder: (BuildContext ctx, index) {
                            return const ShimmerAffect();
                          },
                        ),
                    error: (error, stack) => Center(
                          child: Text("$error"),
                        ));
              },
              loading: () =>const  CircularProgressIndicator(),
              error: (error, stack) => Center(
                    child: Text("$error"),
                  )),
        ],
      ),
    );
  }
}
