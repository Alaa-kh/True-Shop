import 'package:asroo_app/logic/controllers/settings_controller.dart';
import 'package:asroo_app/utils/my_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({super.key});
  final controller = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: languageSettings),
                        child: const Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextUtils(
                          text: 'Language'.tr,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode ? Colors.white : Colors.black)
                    ],
                  ),
                ),
                Container(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        icon: Icon(Icons.arrow_drop_down,
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                        iconSize: 25,
                        items: [
                          DropdownMenuItem(
                              value: ene,
                              child: Text(
                                english,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                          DropdownMenuItem(
                              value: ara,
                              child: Text(
                                arabic,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                          DropdownMenuItem(
                              value: fra,
                              child: Text(
                                france,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )),
                        ],
                        value: controller.langLocal,
                        onChanged: (value) {
                          controller.changeLanguage(value!);
                          Get.updateLocale(Locale(value));
                        }),
                  ),
                  width: 120,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          width: 2)),
                )
              ],
            ));
  }
}
