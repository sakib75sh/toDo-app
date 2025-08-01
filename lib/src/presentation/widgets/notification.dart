import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationServece {
  final notificationsplugin = FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  // initialize

  Future<void> intiNotification() async {
    if (_isInitialized) return; // prevent reinitialize

    //initial time zone handling
    tz.initializeTimeZones();
    final String currentTimezone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimezone));

    //prepare android init setting
    const initSettingAndroid = AndroidInitializationSettings(
      "@mipmap/ic_launcher",
    );

    // init setting
    const inItsetting = InitializationSettings(android: initSettingAndroid);

    // finally initialize the plugin

    await notificationsplugin.initialize(inItsetting);
    _isInitialized = true; /////////////////
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

  // show notification at a specific time

  Future<void> scheudleNotification({
    int id = 1,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    //get the current Date and time in local device timeZone

    final now = tz.TZDateTime.now(tz.local);

    // create date and time for today at the specific time and date

    var scheudleTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // scheudle the notification

    await notificationsplugin.zonedSchedule(
      id,
      title,
      body,
      scheudleTime,
      notificationDetails(),

      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,

      // make notification repeat daily.
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  // cancel all notification
  Future<void> cancelAllNotification() async {
    await notificationsplugin.cancelAll();
  }
}
