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
    apiKey: 'AIzaSyCTtxd47C9fzbXpgfS_vpDEmvTntGkjWQ8',
    appId: '1:251765124592:web:ad6ff3c0d126cbff1e0135',
    messagingSenderId: '251765124592',
    projectId: 'coupbin-5ca66',
    authDomain: 'coupbin-5ca66.firebaseapp.com',
    databaseURL: 'https://coupbin-5ca66-default-rtdb.firebaseio.com',
    storageBucket: 'coupbin-5ca66.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqV2d-X6u8t6m2cZlQVs0UPSsgt4mrzuY',
    appId: '1:251765124592:android:9e3718cda29e09681e0135',
    messagingSenderId: '251765124592',
    projectId: 'coupbin-5ca66',
    databaseURL: 'https://coupbin-5ca66-default-rtdb.firebaseio.com',
    storageBucket: 'coupbin-5ca66.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVZEHXopp-Kxop-uvYWRqVUf3LHxZBurE',
    appId: '1:251765124592:ios:4639db2ddd0cf20e1e0135',
    messagingSenderId: '251765124592',
    projectId: 'coupbin-5ca66',
    storageBucket: 'coupbin-5ca66.firebasestorage.app',
    databaseURL: 'https://coupbin-5ca66-default-rtdb.firebaseio.com',
    iosBundleId: 'com.example.zoomClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDLMyCXtakYyxeLwS01pumDyaI481eEPJ0',
    appId: '1:251765124592:web:d50eb920852ba14c1e0135',
    messagingSenderId: '251765124592',
    projectId: 'coupbin-5ca66',
    authDomain: 'coupbin-5ca66.firebaseapp.com',
    databaseURL: 'https://coupbin-5ca66-default-rtdb.firebaseio.com',
    storageBucket: 'coupbin-5ca66.firebasestorage.app',
  );
}
