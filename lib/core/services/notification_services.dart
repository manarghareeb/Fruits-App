import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initLocalNotification() async {
    var androidInitialization = const AndroidInitializationSettings(
      "@mipmap/ic_launcher",
    );
    var iosInitialization = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
    );

    var initializationSetting = InitializationSettings(
      android: androidInitialization,
      iOS: iosInitialization,
    );
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSetting,
      onDidReceiveNotificationResponse: (payload) async {},
    );
  }

  void firebaseInit()  {
    FirebaseMessaging.onMessage.listen((message) {
      showFirebaseNotification(message);
    });
  }

  NotificationDetails notificationDetails({
    required String channelId,
    required channelName,
  }) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        channelName,
        channelDescription: "your channel description",
        importance: Importance.high,
        priority: Priority.high,
        ticker: "ticker",
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
  }

  AndroidNotificationChannel channel = AndroidNotificationChannel(
    Random.secure().nextInt(100000).toString(),
    "High Importance Notification",
    importance: Importance.max,
  );

  Future<void> showFirebaseNotification(RemoteMessage message) async {
    Future.delayed(Duration.zero, () async {
      _flutterLocalNotificationsPlugin.show(
        id: 0,
        title: message.notification!.title.toString(),
        body: message.notification!.body.toString(),
        notificationDetails: await notificationDetails(
          channelId: channel.id.toString(),
          channelName: channel.name.toString(),
        ),
      );
    });
  }
}
