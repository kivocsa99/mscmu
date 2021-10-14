import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'presentation/screens/on_boarding_screen.dart';
import 'application/provider/sharedpref/pref_provider.dart';
import 'presentation/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize(debug: true);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const ProviderScope(child: MyApp()));
  });
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pref = useProvider(sharedPreferences);

    return pref.when(
        data: (pref) {
          final iswelcome = pref.getBool("iswelcome");
          final isclinical = pref.getBool("isclinical");
          if (isclinical == true) {
            context.read(prefChangeNotifierProvider).setYearId2(9);
          } else {
            context.read(prefChangeNotifierProvider).setYearId2(1);
          }

          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Msc-mu',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Scaffold(
                  body: iswelcome == true
                      ? const HomeScreen()
                      : const OnBoardingScreen()));
        },
        loading: () => const Material(
                child: Center(
              child: CircularProgressIndicator(),
            )),
        error: (error, stack) => Center(
              child: Text("$error"),
            ));
  }
}


//TODO
//1- share newfeed url

