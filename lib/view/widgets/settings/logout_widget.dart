import 'package:asroo_app/logic/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_) => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: 'LogOut From App',
                    titleStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    middleText: 'Are you sure you need to logout ?',
                    middleTextStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    backgroundColor: Colors.grey,
                    radius: 10,
                    textCancel: ' NO ',
                    textConfirm: ' YES ',
                    cancelTextColor: Colors.white,
                    confirmTextColor: Colors.white,
                    onCancel: () => Get.back(),
                    onConfirm: () => controller.signOutFrormApp(),
                    buttonColor: Get.isDarkMode ? blueClr : mainColor,
                  );
                },
                splashColor: Get.isDarkMode
                    ? blueClr.withOpacity(.4)
                    : mainColor.withOpacity(.4),
                borderRadius: BorderRadius.circular(12),
                customBorder: const StadiumBorder(),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: logOutSettings),
                      child: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextUtils(
                        text: 'Logout'.tr,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black)
                  ],
                ),
              ),
            ));
  }
}
