import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:asroo_app/logic/controllers/auth_controller.dart';
import 'package:asroo_app/utils/my_string.dart';
import 'package:asroo_app/utils/theme.dart';

import '../../../routes/routes.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_from_filed.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Get.isDarkMode
                            ? Lottie.asset('assets/animations/loginmorado.json',
                                width: 170,
                                reverse: true,
                                repeat: true,
                                fit: BoxFit.cover)
                            : Lottie.asset('assets/animations/hello.json',
                                width: 200,
                                reverse: true,
                                repeat: true,
                                fit: BoxFit.cover),
                        const SizedBox(
                          height: 30,
                        ),
                        AuthTextFromFiled(
                          obscureText: false,
                          controller: emailController,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid Email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? const Icon(
                                  Icons.email,
                                  color: mainColor,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.email,
                                  color: blueClr,
                                  size: 30,
                                ),
                          suffixIcon: const Text(''),
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<AuthController>(
                          builder: (_) => AuthTextFromFiled(
                            obscureText: controller.isVisibility ? false : true,
                            controller: passwordController,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return 'Password should be longer or equal to 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? const Icon(
                                    Icons.lock,
                                    color: mainColor,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.lock,
                                    color: blueClr,
                                    size: 30,
                                  ),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.black,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: Colors.black,
                                      )),
                            hintText: 'Password',
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.offNamed(Routes.forgetPasswordScreen);
                              },
                              child: TextUtils(
                                  text: 'Forget Password ?',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white)),
                        ),
                        const SizedBox(height: 30),
                        GetBuilder<AuthController>(
                            builder: (_) => AuthButton(
                                  onPressed: () {
                                    if (fromKey.currentState!.validate()) {
                                      controller.logInUsingFirebase(
                                          email: emailController.text.trim(),
                                          password: passwordController.text);
                                    }
                                  },
                                  text: 'LOG IN',
                                )),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                  text: "Don't Have an Account? ",
                  textType: 'Sign Up',
                  onPressed: () {
                    Get.offNamed(Routes.signupScreen);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
