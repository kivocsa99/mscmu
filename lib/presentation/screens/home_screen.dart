import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:mscmu/application/provider/auth.facade.provider.dart';
import 'package:mscmu/application/provider/current_user.provider.dart';
import 'package:mscmu/application/provider/sharedpref/pref_provider.dart';
import 'package:mscmu/infrastructure/messaging/services/messaging.repository.dart';
import 'package:mscmu/navigate.dart';
import 'package:mscmu/presentation/screens/on_boarding_screen.dart';

import 'aboutus_screen.dart';
import 'contactus_screen.dart';
import 'gallery_screen.dart';
import 'importantlinks_screen.dart';
import 'libraryscreen.dart';
import 'main_screen.dart';
import 'quiz_list_screen.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pref = useProvider(sharedPreferences);
    final admin = useProvider(currentUserProvider);

    useEffect(() {
      FirebaseMessaging.instance.requestPermission(
        sound: true,
        badge: true,
        alert: true,
        provisional: false,
      );

      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (message.notification != null) {
          MotionToast.info(
                  position: MOTION_TOAST_POSITION.TOP,
                  animationType: ANIMATION.FROM_TOP,
                  title: "New Post",
                  titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                  description: message.notification!.body!)
              .show(context);
        }
      });
    }, const []);

    final _showPage = useState(0);
    final _key = useState(GlobalKey<ScaffoldState>());
    return Scaffold(
      key: _key.value,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset(
                "images/logo.png",
                fit: BoxFit.contain,
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.notification_important),
              title: const Text("Importnat Links"),
              onTap: () {
                Navigator.pop(context);
                _showPage.value = 3;
              },
            ),
            ListTile(
              leading: const Icon(Icons.collections),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                _showPage.value = 4;
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("About us"),
              onTap: () {
                Navigator.pop(context);
                _showPage.value = 5;
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text("contact us"),
              onTap: () {
                Navigator.pop(context);
                _showPage.value = 6;
              },
            ),
            pref.maybeWhen(
                orElse: () => const SizedBox.shrink(),
                data: (prefs) {
                  final yearName = prefs.getString("yearName");
                  return admin.maybeWhen(
                    data: (user) => ListTile(
                      leading: const Icon(FontAwesomeIcons.signOutAlt),
                      title: const Text("Log Out"),
                      onTap: () async {
                        await context.read(msgprovider).unsubsribe(yearName!);

                        await context.read(authFacadeProvider).signOut().then(
                            (value) => context
                                .read(prefChangeNotifierProvider)
                                .clearAllValues());
                        changeScreenReplacement(
                            context, const OnBoardingScreen());
                      },
                    ),
                    orElse: () => ListTile(
                      leading: const Icon(FontAwesomeIcons.signOutAlt),
                      title: const Text("Log Out"),
                      onTap: () async {
                        await context.read(msgprovider).unsubsribe(yearName!);

                        context
                            .read(prefChangeNotifierProvider)
                            .clearAllValues();

                        changeScreenReplacement(
                            context, const OnBoardingScreen());
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Image.asset(
          "images/logo.png",
          scale: 10,
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
      body: IndexedStack(
        index: _showPage.value,
        children: const [
          MainScreen(),
          LibraryScreen(),
          QuizListScreen(),
          ImportantLinksScreen(),
          GalleryScreen(),
          AboutUsScreen(),
          ContactusScreen(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: "home",
        onPressed: () {
          _showPage.value = 0;
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.home),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(45)),
        child: SizedBox(
          child: BottomAppBar(
            color: Colors.blue,
            shape: const CircularNotchedRectangle(),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                    onPressed: () {
                      _showPage.value = 1;
                    },
                    icon: const Icon(
                      FontAwesomeIcons.folderOpen,
                      color: Colors.white,
                    )),
                const Spacer(),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      _showPage.value = 2;
                    },
                    icon: const Icon(
                      FontAwesomeIcons.questionCircle,
                      color: Colors.white,
                    )),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
