import 'package:asroo_app/logic/controllers/auth_controller.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/my_string.dart';
import '../../widgets/auth/auth_text_from_filed.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  final controller = Get.find<AuthController>();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          centerTitle: true,
          title: Text(
            'Forget Password',
            style: TextStyle(color: Get.isDarkMode ? mainColor : blueClr),
          ),
          leading: IconButton(
              onPressed: () {
                Get.offNamed(Routes.logineScreen);
              },
              icon: Icon(Icons.arrow_back,
                  color: Get.isDarkMode ? Colors.black : Colors.white)),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Get.offNamed(Routes.logineScreen);
                        },
                        icon: Icon(Icons.close_rounded,
                            color:
                                Get.isDarkMode ? Colors.black : Colors.white)),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'If you want to recover your account, then please provide your email ID below..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white),
                  ),
                  const SizedBox(height: 50),
                  Get.isDarkMode
                      ? Image.asset(
                          'assets/images/undraw_Forgot_password_re_hxwm-removebg-preview.png',
                          width: 300)
                      : Image.asset(
                          'assets/images/undraw_Forgot_password_re_hxwm__1_-removebg-preview.png',
                          width: 300),
                  const SizedBox(height: 50),
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
                  const SizedBox(height: 50),
                  GetBuilder<AuthController>(
                      builder: (_) => AuthButton(
                          text: 'SEND',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              controller
                                  .resetPassword(emailController.text.trim());
                            }
                          }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
