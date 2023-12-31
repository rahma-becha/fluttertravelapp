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
    apiKey: 'AIzaSyDGyH329SlgffpItLTvS29qTV5y42TFThY',
    appId: '1:869168958253:web:efc16da6a99c42358a21a4',
    messagingSenderId: '869168958253',
    projectId: 'fluttertravelapp-1967b',
    authDomain: 'fluttertravelapp-1967b.firebaseapp.com',
    storageBucket: 'fluttertravelapp-1967b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_l4rUQIxJFsJofIGdqWlTfDxa7kGEVsE',
    appId: '1:869168958253:android:7aae47fc621ea0118a21a4',
    messagingSenderId: '869168958253',
    projectId: 'fluttertravelapp-1967b',
    storageBucket: 'fluttertravelapp-1967b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTI8YDWDfEbOR5FqDpJeDk49oz4mZYGqY',
    appId: '1:869168958253:ios:49f8935e508b6ca48a21a4',
    messagingSenderId: '869168958253',
    projectId: 'fluttertravelapp-1967b',
    storageBucket: 'fluttertravelapp-1967b.appspot.com',
    iosBundleId: 'com.example.projetmobilev2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTI8YDWDfEbOR5FqDpJeDk49oz4mZYGqY',
    appId: '1:869168958253:ios:aceaf513b797ff378a21a4',
    messagingSenderId: '869168958253',
    projectId: 'fluttertravelapp-1967b',
    storageBucket: 'fluttertravelapp-1967b.appspot.com',
    iosBundleId: 'com.example.projetmobilev2.RunnerTests',
  );
}
