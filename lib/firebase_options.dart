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
        return macos;
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
    apiKey: 'AIzaSyDZuOnsDSGibqC6ogGcgk3GPVALh3k_xZY',
    appId: '1:182968791283:web:fed449640ebbb72bb90786',
    messagingSenderId: '182968791283',
    projectId: 'grocery-app-86256',
    authDomain: 'grocery-app-86256.firebaseapp.com',
    storageBucket: 'grocery-app-86256.appspot.com',
    measurementId: 'G-LQLJ3N6VD9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgTvoodBFMPX3jg8RIr3-K6mTVAbJveow',
    appId: '1:182968791283:android:d2124c4a91c977a7b90786',
    messagingSenderId: '182968791283',
    projectId: 'grocery-app-86256',
    storageBucket: 'grocery-app-86256.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAf2n2T_AhiBhdtEAI7Q7-TzEMrVqbpq5c',
    appId: '1:182968791283:ios:b53de0eafe054cebb90786',
    messagingSenderId: '182968791283',
    projectId: 'grocery-app-86256',
    storageBucket: 'grocery-app-86256.appspot.com',
    iosClientId: '182968791283-fta5l4puqg61eqjrn00ougld6j4d64j1.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstChallenge',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAf2n2T_AhiBhdtEAI7Q7-TzEMrVqbpq5c',
    appId: '1:182968791283:ios:b37c8a656e364952b90786',
    messagingSenderId: '182968791283',
    projectId: 'grocery-app-86256',
    storageBucket: 'grocery-app-86256.appspot.com',
    iosClientId: '182968791283-172ikdan3ltvc1nd6tq6luu9d87bb9n5.apps.googleusercontent.com',
    iosBundleId: 'com.example.firstChallenge.RunnerTests',
  );
}
