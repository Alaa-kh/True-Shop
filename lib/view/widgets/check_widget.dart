import 'package:asroo_app/logic/controllers/auth_controller.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChickWidget extends StatelessWidget {
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkbox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: controller.isCheckBox
                  ? Get.isDarkMode
                      ? Image.asset('assets/images/check.png')
                      : const Icon(Icons.done, color: blueClr, size: 30)
                  : Container(),
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: <Widget>[
              TextUtils(
                  text: 'I accept',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.black : Colors.white),
              const SizedBox(width: 7),
              TextUtils(
                  text: 'Terms & Conditions',
                  underline: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Get.isDarkMode ? Colors.black : Colors.white)
            ],
          )
        ],
      ),
    );
  }
}
