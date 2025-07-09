// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:awesome_notifications/awesome_notifications.dart';

Future<void> initNotifications() async {
  AwesomeNotifications().initialize(
    null, // ícono por defecto del sistema o poné el nombre del tuyo (sin extensión)
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Notificaciones Básicas',
        channelDescription: 'Canal para notificaciones locales',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      ),
    ],
    debug: true,
  );

  // Solicitar permiso si aún no fue concedido
  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowed) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }
}
