import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../widgets/cart/cart_product_card.dart';
import '../../widgets/cart/cart_total.dart';

class CartScreen extends StatelessWidget {
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: context.theme.canvasColor,
            appBar: AppBar(
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      controller.clearAllProducts();
                    },
                    icon: const Icon(Icons.backspace))
              ],
              title: const Text('Card Items'),
              elevation: 0,
              backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            ),
            body: Obx(
              () {
                if (controller.productsMap.isEmpty) {
                  return EmptyCart();
                } else {
                  return SingleChildScrollView(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 600,
                        child: ListView.separated(
                            itemBuilder: (context, index) => CartProductCard(
                                  quantity: controller.productsMap.values
                                      .toList()[index],
                                  index: index,
                                  productModels: controller.productsMap.keys
                                      .toList()[index],
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 20),
                            itemCount: controller.productsMap.length),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CartTotal(),
                      )
                    ],
                  ));
                }
              },
            )));
  }
}
