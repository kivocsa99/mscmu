import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mscmu/infrastructure/messaging/services/messaging.repository.dart';
import 'login_screen.dart';
import '../../application/provider/sharedpref/pref_provider.dart';
import '../../constants.dart';
import '../../navigate.dart';
import 'home_screen.dart';
import '../widgets/growing_logo.dart';
import '../../application/provider/years.repository.provider.dart';
import '../widgets/shimmer_affect.dart';

class WelcomeScreen extends HookWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final role = useState("Major");
    final disableButton = useState(false);
    final yearId2 = useState(9);
    final years = useProvider(allYearsProvider);
    final yearName = useState("Wateen");
    final yearId = useState(15);
    final isclinical = useState(false);
    final logoAppeared = useState(false);
    const Duration animationDuration = Duration(milliseconds: 3000);
    var animationController1 =
        useAnimationController(duration: animationDuration);
    animationController1.forward().then((_) {
      logoAppeared.value = true;
    });

    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: GrowingLogo(
                  controller: animationController1,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 5000),
                  opacity: logoAppeared.value == true ? 1.0 : 0.0,
                  child: years.when(
                    data: (years) => Column(children: [
                      SizedBox(
                        height: 250,
                        child: CupertinoPicker(
                          looping: true,
                          children: years.classes!
                              .map((e) => Center(
                                    child: Text(e.name!),
                                  ))
                              .toList(),
                          itemExtent: 46,
                          onSelectedItemChanged: (index) async {
                            isclinical.value =
                                years.classes![index].isclinical!;
                            yearId.value = years.classes![index].id!;
                            yearName.value = years.classes![index].name!;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 210,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.1)),
                        child: Center(
                            child: Text(
                          yearName.value,
                          style: const TextStyle(fontSize: 24),
                        )),
                      )
                    ]),
                    loading: () => const ShimmerAffect(height: 100, width: 100),
                    error: (error, stack) => Center(
                      child: Text("$error"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: AnimatedOpacity(
          opacity: logoAppeared.value == true ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 5000),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                child: const Icon(Icons.add_moderator),
                tooltip: "login as moderator",
                onPressed: () async {
                  Navigator.of(context)
                      .push(createRoute(() => const Scaffold(body: Login())));
                },
              ),
              FloatingActionButton(
                heroTag: "btn2",
                child: const Icon(Icons.forward),
                tooltip: "select a class",
                onPressed: () async {
                  if (isclinical.value == false) {
                    await context.read(msgprovider).subsribe(yearName.value);
                    context
                        .read(prefChangeNotifierProvider)
                        .setYearName(yearName.value);
                    context
                        .read(prefChangeNotifierProvider)
                        .setYearId(yearId.value);
                    context.read(prefChangeNotifierProvider).setIsWelcome(true);

                    Future.delayed(const Duration(milliseconds: 500), () {
                      changeScreenReplacement(context, const HomeScreen());
                    });
                  } else {
                    context
                        .read(prefChangeNotifierProvider)
                        .setYearId(yearId.value);

                    showDialog(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                          return AlertDialog(
                            title:
                                const Center(child: Text('Select your class')),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      margin: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: role.value == "Majors"
                                            ? Colors.lightBlue
                                            : Colors.transparent
                                                .withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.medical_services),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Majors",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      setState(() {
                                        disableButton.value = true;
                                        role.value = "Majors";
                                        yearId2.value = 9;
                                      });
                                    }),
                                GestureDetector(
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      margin: const EdgeInsets.all(15.0),
                                      decoration: BoxDecoration(
                                        color: role.value == "Minors"
                                            ? Colors.lightBlue
                                            : Colors.transparent
                                                .withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(Icons.medical_services),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Minors",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () async {
                                      setState(() {
                                        disableButton.value = true;
                                        role.value = "Minors";
                                        yearId2.value = 10;
                                      });
                                    }),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                child: const Text('CANCEL'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await context
                                      .read(msgprovider)
                                      .subsribe(yearName.value);
                                  context
                                      .read(prefChangeNotifierProvider)
                                      .setYearName(yearName.value);
                                  context
                                      .read(prefChangeNotifierProvider)
                                      .setIsWelcome(true);
                                  context
                                      .read(prefChangeNotifierProvider)
                                      .setisclinical(true);
                                  context
                                      .read(prefChangeNotifierProvider)
                                      .setYearId2(yearId2.value);

                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    changeScreenReplacement(
                                        context, const HomeScreen());
                                  });
                                },
                                child: const Text('ACCEPT'),
                              ),
                            ],
                          );
                        });
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
