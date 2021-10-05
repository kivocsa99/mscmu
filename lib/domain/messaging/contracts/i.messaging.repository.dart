import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

abstract class IMessagingRepository {
  Future<void> subsribe(String topic);
  Future<void> unsubsribe(String topic);
  StreamSubscription<RemoteMessage> get onmessage;
}
