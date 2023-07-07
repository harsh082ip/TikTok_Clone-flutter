import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/views/Screens/auth/signup_screen.dart';
import 'package:tiktok_clone/views/Screens/widgets/glitch_effect.dart';
import 'package:tiktok_clone/views/Screens/widgets/text_input_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlithEffect(
              child: Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                child: const Text(
                  'TikTok',
                  style: TextStyle(
                      fontSize: 45.0,
                      color: buttonColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                      wordSpacing: 20.0),
                ),
              ),
            ),
            TextInputField(
                controller: emailController,
                icon: Icons.email,
                labelText: 'Email'),
            const SizedBox(
              height: 12.0,
            ),
            TextInputField(
              controller: passwordController,
              icon: Icons.lock,
              labelText: 'password',
              isHide: true,
            ),
            Container(
              margin: const EdgeInsets.only(top: 18.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                  onPressed: () {
                    Auth.instnace
                        .login(emailController.text, passwordController.text);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 68.0),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
