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
        return macos;
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
    apiKey: 'AIzaSyCtzIepRudQHzWj0s3CkJVvfIrdGZQzjW4',
    appId: '1:399473522204:web:7b13da0308c94046e351d9',
    messagingSenderId: '399473522204',
    projectId: 'recipe-47556',
    authDomain: 'recipe-47556.firebaseapp.com',
    storageBucket: 'recipe-47556.appspot.com',
    measurementId: 'G-FC8SJ9V0BP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvQ-WC7GUZG_os7zo4B4vW2DdkWWb9rRU',
    appId: '1:399473522204:android:1abcb9ec0be8040ee351d9',
    messagingSenderId: '399473522204',
    projectId: 'recipe-47556',
    storageBucket: 'recipe-47556.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcqIJik6Z1MSOYBVnJs6TcBwirAazh-70',
    appId: '1:399473522204:ios:8198faa58ca9ae15e351d9',
    messagingSenderId: '399473522204',
    projectId: 'recipe-47556',
    storageBucket: 'recipe-47556.appspot.com',
    iosBundleId: 'com.example.recipeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcqIJik6Z1MSOYBVnJs6TcBwirAazh-70',
    appId: '1:399473522204:ios:8198faa58ca9ae15e351d9',
    messagingSenderId: '399473522204',
    projectId: 'recipe-47556',
    storageBucket: 'recipe-47556.appspot.com',
    iosBundleId: 'com.example.recipeApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCtzIepRudQHzWj0s3CkJVvfIrdGZQzjW4',
    appId: '1:399473522204:web:a4cd480dda399a72e351d9',
    messagingSenderId: '399473522204',
    projectId: 'recipe-47556',
    authDomain: 'recipe-47556.firebaseapp.com',
    storageBucket: 'recipe-47556.appspot.com',
    measurementId: 'G-8FVKTQ549V',
  );
}
