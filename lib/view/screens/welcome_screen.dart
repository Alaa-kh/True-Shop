import 'package:asroo_app/routes/routes.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        SizedBox(
          width: double.infinity,
          height: 500,
          child: Image.asset(
            'assets/images/undraw_Shopping_Bags_m7sb.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 190),
              const SizedBox(height: 250),
              const SizedBox(height: 50),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12)),
                  onPressed: () {
                    Get.offNamed(Routes.logineScreen);
                  },
                  child: const TextUtils(
                      text: 'Get Started',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const TextUtils(
                      text: "Don't Have an Account ?",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                  TextButton(
                      onPressed: () {
                        Get.offNamed(Routes.signupScreen);
                      },
                      child: const TextUtils(
                        text: 'Sign Up',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        underline: TextDecoration.underline,
                      ))
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
