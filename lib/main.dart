import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/views/Screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/Screens/auth/signup_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp().then((value) {
  //   Get.put(Auth());
  // });

  _initializeFireBase();
  runApp(const MyApp());
}

_initializeFireBase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(Auth());
  });
  print('firebase initialized');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
      home: SignUp(),
    );
  }
}
