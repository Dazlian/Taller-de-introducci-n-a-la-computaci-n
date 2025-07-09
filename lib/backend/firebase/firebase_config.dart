import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBFPjuDqaWIYp1NW_CLUAM-9KivmRo2ZcU",
            authDomain: "calendartic-a4352.firebaseapp.com",
            projectId: "calendartic-a4352",
            storageBucket: "calendartic-a4352.firebasestorage.app",
            messagingSenderId: "442917930577",
            appId: "1:442917930577:web:5f3950cb022f5014329a70",
            measurementId: "G-E8PSMN7FE0"));
  } else {
    await Firebase.initializeApp();
  }
}
