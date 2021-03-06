// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAalrVWczcdYPWHEJdPRWlQi0wegrdZd6Y',
    appId: '1:264096224162:web:48fed4e5a9a4cfdded98fb',
    messagingSenderId: '264096224162',
    projectId: 'garces-chat-app',
    authDomain: 'garces-chat-app.firebaseapp.com',
    storageBucket: 'garces-chat-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDivFdOvOksH9tAd1BqXnMzxspU2N8XwEg',
    appId: '1:264096224162:android:a3e7749966861c91ed98fb',
    messagingSenderId: '264096224162',
    projectId: 'garces-chat-app',
    storageBucket: 'garces-chat-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrYtGzj14XeSp48gmT54pZ55Sz1pJ-W-4',
    appId: '1:264096224162:ios:feadbd0eba9fa073ed98fb',
    messagingSenderId: '264096224162',
    projectId: 'garces-chat-app',
    storageBucket: 'garces-chat-app.appspot.com',
    iosClientId: '264096224162-tks46t5tsrm441e4r7l4c0b71pid7unq.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatApp',
  );
}
