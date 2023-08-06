import 'package:asroo_app/routes/routes.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Get.isDarkMode
              ? Lottie.asset('assets/animations/emptycart.json',
                  width: 300, reverse: true, repeat: true, fit: BoxFit.cover)
              : Lottie.asset('assets/animations/cartempty.json',
                  width: 300, reverse: true, repeat: true, fit: BoxFit.cover),
          const SizedBox(height: 40),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Your Cart is ',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black)),
            TextSpan(
                text: 'Empty',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? blueClr : mainColor))
          ])),
          const SizedBox(height: 10),
          Text(
            'Add items to get Started',
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 0,
                    backgroundColor: Get.isDarkMode ? blueClr : mainColor),
                onPressed: () {
                  Get.offNamed(Routes.mainScreen);
                },
                child: const Text(
                  'Go To Home',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
