import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServece {
  final notificationsplugin = FlutterLocalNotificationsPlugin();
  final bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  // initialize

  Future<void> intiNotification() async {
    if (_isInitialized) return; // prevent reinitialize

    //prepare android init setting
    const initSettingAndroid = AndroidInitializationSettings(
      "@mipmap/ic_launcher",
    );

    // init setting
    const inItsetting = InitializationSettings(android: initSettingAndroid);

    // finally initialize the plugin

    await notificationsplugin.initialize(inItsetting);
  }

  // notification detail setup

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "Daily notification-id",
        'daily notification',
        channelDescription: "daily Notification",
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }

  // show notification

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async {
    return notificationsplugin.show(id, title, body, notificationDetails());
  }

  // on notification tap
}
