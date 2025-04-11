import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBEaSi_Kfm0A9E91BuPlCJBZg_7fjO4K3o",
            authDomain: "dreamshare-85b9a.firebaseapp.com",
            projectId: "dreamshare-85b9a",
            storageBucket: "dreamshare-85b9a.firebasestorage.app",
            messagingSenderId: "957845781495",
            appId: "1:957845781495:web:ced3bf116267eac4934cf2",
            measurementId: "G-9FPKB9Q7D7"));
  } else {
    await Firebase.initializeApp();
  }
}
