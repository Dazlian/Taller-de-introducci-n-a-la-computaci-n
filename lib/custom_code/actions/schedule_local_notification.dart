// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> scheduleLocalNotification(
  String id,
  String title,
  String body,
  DateTime scheduledDateTime,
) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id.hashCode,
      channelKey: 'basic_channel',
      title: title,
      body: body,
      notificationLayout: NotificationLayout.Default,
    ),
    schedule: NotificationCalendar.fromDate(date: scheduledDateTime),
  );
}
