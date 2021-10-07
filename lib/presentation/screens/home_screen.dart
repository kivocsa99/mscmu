import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

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
          print(
              'Message also contained a notification: ${message.notification}');
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
        children: [
          const MainScreen(),
          LibraryScreen(),
          const QuizListScreen(),
          const ImportantLinksScreen(),
          GalleryScreen(),
          const AboutusScreen(),
          const ContactusScreen(),
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
