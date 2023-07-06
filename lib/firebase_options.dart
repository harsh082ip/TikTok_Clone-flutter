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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3iYgoWQXZeziBYsJHVLwDUuT-o6-WkHQ',
    appId: '1:196735070270:android:0f1459bad5b52a3e63216f',
    messagingSenderId: '196735070270',
    projectId: 'tiktok-clone-49afd',
    storageBucket: 'tiktok-clone-49afd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByEnxLFCnqph6u_WYF7kYKo5rI1k0KH7w',
    appId: '1:196735070270:ios:c4e3bbcc1f1fd0b763216f',
    messagingSenderId: '196735070270',
    projectId: 'tiktok-clone-49afd',
    storageBucket: 'tiktok-clone-49afd.appspot.com',
    iosClientId: '196735070270-0reli0frvpvcj3q9iravg9t12e0i9d7d.apps.googleusercontent.com',
    iosBundleId: 'com.harsh082ip.tiktokclone.tiktokClone',
  );
}
