import 'dart:developer';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  static Future init() async {
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("a691b102-373e-4fe8-9e60-56f7479b3a44");
    OneSignal.Notifications.requestPermission(true);

    OneSignal.Notifications.addClickListener((event) {
      final data = event.notification.additionalData;
      log("Notification clicked! Data: $data");
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      log("Notification received in foreground: ${event.notification.title}");
      event.preventDefault();
      event.notification.display();
    });
  }
}
