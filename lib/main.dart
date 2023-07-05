import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/Screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/Screens/auth/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok Clone',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
      home: SignUp(),
    );
  }
}
