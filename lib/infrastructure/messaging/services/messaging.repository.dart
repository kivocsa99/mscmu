import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mscmu/domain/messaging/contracts/i.messaging.repository.dart';

final msgprovider =
    Provider<IMessagingRepository>((ref) => MessagingRepository());

class MessagingRepository implements IMessagingRepository {
  final _msg = FirebaseMessaging.instance;
  @override
  Future<void> subsribe(String topic) {
    return _msg.subscribeToTopic(topic);
  }

  @override
  Future<void> unsubsribe(String topic) {
    return _msg.unsubscribeFromTopic(topic);
  }

  @override
  StreamSubscription<RemoteMessage> get onmessage {
    return FirebaseMessaging.onMessage.listen((event) {
    });
  }
}
