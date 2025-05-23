// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBrAEXHaDvZAytU-NdYQlZikhd2_f8j8xM',
    appId: '1:1037569854283:web:12ce32a1180ed9d17cf6ce',
    messagingSenderId: '1037569854283',
    projectId: 'praktikumpbm-d585b',
    authDomain: 'praktikumpbm-d585b.firebaseapp.com',
    storageBucket: 'praktikumpbm-d585b.firebasestorage.app',
    measurementId: 'G-1XBYXEG5LC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZPgCc6p7kPrnH3zbNByuo7uR629Tc4ZI',
    appId: '1:1037569854283:android:501f7681e106093d7cf6ce',
    messagingSenderId: '1037569854283',
    projectId: 'praktikumpbm-d585b',
    storageBucket: 'praktikumpbm-d585b.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBrAEXHaDvZAytU-NdYQlZikhd2_f8j8xM',
    appId: '1:1037569854283:web:83d5d69ba0e138f87cf6ce',
    messagingSenderId: '1037569854283',
    projectId: 'praktikumpbm-d585b',
    authDomain: 'praktikumpbm-d585b.firebaseapp.com',
    storageBucket: 'praktikumpbm-d585b.firebasestorage.app',
    measurementId: 'G-22H8QF739Y',
  );
}
