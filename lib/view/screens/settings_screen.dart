import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/settings/dark_mode_widget.dart';
import '../widgets/settings/language_widget.dart';
import '../widgets/settings/logout_widget.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(
            height: 20,
          ),
          TextUtils(
              text: 'GENERAL'.tr,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? blueClr : mainColor),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget()
        ],
      ),
    );
  }
}
