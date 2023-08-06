import 'package:flutter/material.dart';

import 'package:asroo_app/utils/theme.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: TextUtils(
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Get.isDarkMode ? mainColor : blueClr,
          minimumSize: const Size(360, 50)),
    );
  }
}
