import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import '../widgets/news_header.dart';
import '../widgets/posts.dart';
import '../widgets/yearsrow.dart';

class MainScreen extends HookWidget {
  const MainScreen({Key? key}) : super(key: key);

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
                  toastDuration: Duration(seconds: 1),
                  position: MOTION_TOAST_POSITION.TOP,
                  animationType: ANIMATION.FROM_TOP,
                  title: "New Notification",
                  titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                  description: message.notification!.body!)
              .show(context);
        }
      });
    });
    return SingleChildScrollView(
      child: Column(
        children: const [
          NewsHeader(),
          YearsRow(),
          Posts(),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
