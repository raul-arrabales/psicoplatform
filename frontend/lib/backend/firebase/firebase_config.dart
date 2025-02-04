import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "XXX ROTATED API KEY XXX",
            authDomain: "psicobotica.firebaseapp.com",
            projectId: "psicobotica",
            storageBucket: "psicobotica.appspot.com",
            messagingSenderId: "934586878125",
            appId: "1:934586878125:web:d48984c4a88a43a8611e24",
            measurementId: "G-MWE688WM02"));
  } else {
    await Firebase.initializeApp();
  }
}
