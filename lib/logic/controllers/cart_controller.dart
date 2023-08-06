import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/product_model.dart';
import '../../notification.dart';
import '../../routes/routes.dart';
import '../../utils/theme.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeProductsFromCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
        buttonColor: Get.isDarkMode ? blueClr : mainColor,
        backgroundColor: Colors.grey,
        radius: 10,
        textCancel: 'No',
        cancelTextColor: Colors.white,
        textConfirm: 'Yes',
        confirmTextColor: Colors.white,
        onCancel: () {
          Get.toNamed(
            Routes.cartScreen,
          );
        },
        onConfirm: () {
          productsMap.clear();
          Get.back();
          NotificationServices.showNotification(
              title: 'Your Cart Is Empty !', body: 'Shop now');
        },
        title: 'Clean Products',
        titleStyle: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        middleText: 'Are you sure you need clear product ?',
        middleTextStyle: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold));
  }

  get productSubTotal => productsMap.entries
      .map((element) => element.key.price * element.value)
      .toList();

  get total => productsMap.entries
      .map((element) => element.key.price * element.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((element) => element.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
