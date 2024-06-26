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
    apiKey: 'AIzaSyAV88vkZWo842H8UWYUP1QDhxzwRyxK5OA',
    appId: '1:1019653885338:web:bbb4080d9357980b42be23',
    messagingSenderId: '1019653885338',
    projectId: 'nerulanding-8f7c4',
    authDomain: 'nerulanding-8f7c4.firebaseapp.com',
    storageBucket: 'nerulanding-8f7c4.appspot.com',
    measurementId: 'G-3XPFRXTGW7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVrh2n1Sfdfc3js1WH8oj_yX6AsN6lYqw',
    appId: '1:1019653885338:android:3018a5e6e9ed1dff42be23',
    messagingSenderId: '1019653885338',
    projectId: 'nerulanding-8f7c4',
    storageBucket: 'nerulanding-8f7c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBuQmFK08CvwjsRIXd5EtaAywsL1nKUCiA',
    appId: '1:1019653885338:ios:702839e6955dce3642be23',
    messagingSenderId: '1019653885338',
    projectId: 'nerulanding-8f7c4',
    storageBucket: 'nerulanding-8f7c4.appspot.com',
    iosBundleId: 'com.example.neruLendingApp',
  );
}
