import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiktok_clone/controller/auth_controller.dart';
import 'package:tiktok_clone/views/Screens/auth/login_screen.dart';

import '../../../constants.dart';
import '../widgets/glitch_effect.dart';
import '../widgets/text_input_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: MediaQuery.of(context).size.height * 0.14),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Welcome Text Widget
              GlithEffect(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  child: const Text(
                    'Welome To TikTok',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: buttonColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),

              // CircleAvatar for uploading Image
              InkWell(
                onTap: () {
                  Auth.instnace.pickImage();
                },
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 65,
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/149/149071.png?w=826&t=st=1688515565~exp=1688516165~hmac=806fd8ab65f04dba05aecb328ff5f00844324baf66344301aee02ffef9207248'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0)),
                        child: const Icon(
                          Icons.edit,
                          size: 25.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // const SizedBox
              const SizedBox(
                height: 28.0,
              ),

              // Email Text Input Field
              TextInputField(
                  controller: emailController,
                  icon: Icons.email,
                  labelText: 'Email'),

              // const SizedBox
              const SizedBox(
                height: 12.0,
              ),

              // Password Text Input Field
              TextInputField(
                controller: passwordController,
                icon: Icons.lock,
                labelText: 'password',
                isHide: true,
              ),

              // const SizedBox
              const SizedBox(
                height: 12.0,
              ),

              // Confirm Password Input Field
              TextInputField(
                controller: confirmPasswordController,
                icon: Icons.lock,
                labelText: 'Confirm Password',
                isHide: true,
              ),

              // const SizedBox
              const SizedBox(
                height: 12.0,
              ),

              // Username Input Text Field
              TextInputField(
                  controller: usernameController,
                  icon: Icons.person,
                  labelText: 'Username'),

              // SignUp Elevated Button
              Container(
                margin: const EdgeInsets.only(top: 18.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                  onPressed: () {
                    Auth.instnace.SignUp(
                        usernameController.text,
                        emailController.text,
                        passwordController.text,
                        Auth.instnace.proImg);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 68.0),
                    child: Text(
                      'SignUp',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
