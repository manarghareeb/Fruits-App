import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fruits_app/core/services/local_notifications_service.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static Future init() async {
    await messaging.requestPermission();
    String? token = await messaging.getToken();
    log(token ?? '');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationsService.showForegroundNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('User opened notification: ${message.notification?.title}');
    });
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }
}
