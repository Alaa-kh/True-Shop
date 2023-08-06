import 'package:asroo_app/logic/controllers/cart_controller.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/payment_screen.dart';

class CartTotal extends StatelessWidget {
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextUtils(
                      text: 'Total',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  Text(
                    '\$${controller.total}',
                    style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 0,
                            backgroundColor:
                                Get.isDarkMode ? blueClr : mainColor),
                        onPressed: () {
                          Get.to(PayMentScreen(),
                              transition: Transition.upToDown);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Check Out',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.shopping_cart)
                          ],
                        ))),
              )
            ],
          ),
        ));
  }
}
