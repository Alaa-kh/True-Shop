import 'package:asroo_app/logic/controllers/auth_controller.dart';
import 'package:asroo_app/utils/my_string.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_from_filed.dart';
import '../../widgets/auth/container_under.dart';
import '../../widgets/check_widget.dart';
import '../../widgets/text_utils.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
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
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Row(children: [
                          TextUtils(
                            text: 'SIGN',
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Get.isDarkMode ? mainColor : blueClr,
                          ),
                          const SizedBox(width: 3),
                          TextUtils(
                            text: 'UP',
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                          )
                        ]),
                        const SizedBox(height: 50),
                        AuthTextFromFiled(
                          obscureText: false,
                          controller: nameController,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid Name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? const Icon(
                                  Icons.person,
                                  color: mainColor,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.person,
                                  color: blueClr,
                                  size: 30,
                                ),
                          suffixIcon: const Text(''),
                          hintText: 'User Name',
                        ),
                        const SizedBox(height: 20),
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
                        const SizedBox(height: 50),
                        ChickWidget(),
                        const SizedBox(height: 50),
                        GetBuilder<AuthController>(
                          builder: (_) => AuthButton(
                            onPressed: () {
                              if (controller.isCheckBox == false) {
                                Get.snackbar('Check Box',
                                    'Please, Accept terms & condition',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white);
                              } else if (fromKey.currentState!.validate()) {
                                controller.signUpUsingFirebase(
                                    name: nameController.text.trim(),
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            text: 'Sign Up',
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                  text: 'Already Have an Account? ',
                  textType: 'Log in',
                  onPressed: () {
                    Get.offNamed(Routes.logineScreen);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
