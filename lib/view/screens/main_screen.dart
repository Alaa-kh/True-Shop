import 'package:asroo_app/logic/controllers/cart_controller.dart';
import 'package:asroo_app/logic/controllers/main_controller.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

import 'auth/cart_screen.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Scaffold(
        backgroundColor: context.theme.canvasColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          title: Text(controller.title[controller.currentIndex.value]),
          centerTitle: true,
          leading: Container(),
          actions: [
            Obx(() => badges.Badge(
                badgeAnimation: const badges.BadgeAnimation.slide(
                  animationDuration: Duration(milliseconds: 400),
                  colorChangeAnimationDuration: Duration(milliseconds: 400),
                  loopAnimation: false,
                  curve: Curves.easeIn,
                  colorChangeAnimationCurve: Curves.ease,
                ),
                child: IconButton(
                  onPressed: () {
                    Get.to(CartScreen(),
                        transition: Transition.cupertino,
                        duration: Duration(milliseconds: 600));
                  },
                  icon: Image.asset('assets/images/shop.png'),
                ),
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                badgeContent: Text(
                  cartController.quantity().toString(),
                  style: const TextStyle(color: Colors.white),
                )))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? blueClr : mainColor,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? blueClr : mainColor,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? blueClr : mainColor,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? blueClr : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: ''),
          ],
          onTap: (index) {
            controller.currentIndex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs.value,
        ),
      ),
    ));
  }
}
