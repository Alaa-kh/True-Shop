import 'package:asroo_app/model/product_model.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../logic/controllers/product_controller.dart';
import '../../screens/product_details_screen.dart';

final controller = Get.find<ProductController>();
final cartController = Get.find<CartController>();

class CardItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
            child: CircularProgressIndicator(
                color: Get.isDarkMode ? blueClr : mainColor));
      } else {
        return Expanded(
          child: controller.searchList.isEmpty &&
                  controller.searchTextController.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset('assets/images/search_empty_dark.png')
                  : Image.asset('assets/images/search_empry_light.png')
              : GridView.builder(
                  itemCount: controller.searchList.isEmpty
                      ? controller.productList.length
                      : controller.searchList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 9,
                      crossAxisSpacing: 6),
                  itemBuilder: (context, index) {
                    if (controller.searchList.isEmpty) {
                      return buildCardItem(
                        image: controller.productList[index].image,
                        price: controller.productList[index].price,
                        rate: controller.productList[index].rating.rate,
                        productId: controller.productList[index].id,
                        productModels: controller.productList[index],
                        onTap: () => Get.to(
                            ProductDetailsScreen(
                              productModels: controller.productList[index],
                            ),
                            transition: Transition.leftToRight),
                      );
                    } else {
                      return buildCardItem(
                        image: controller.searchList[index].image,
                        price: controller.searchList[index].price,
                        rate: controller.searchList[index].rating.rate,
                        productId: controller.searchList[index].id,
                        productModels: controller.searchList[index],
                        onTap: () => Get.to(
                            ProductDetailsScreen(
                              productModels: controller.searchList[index],
                            ),
                            transition: Transition.leftToRight),
                      );
                    }
                  },
                ),
        );
      }
    });
  }
}

Widget buildCardItem({
  required String image,
  required double price,
  required double rate,
  required int productId,
  required ProductModels productModels,
  required Function() onTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(5),
    child: InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5)
            ]),
        child: Column(
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.manageFavorites(productId);
                      },
                      icon: controller.isFavorites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            )),
                  IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price.toString(),
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 25,
                    width: 55,
                    decoration: BoxDecoration(
                        color: Get.isDarkMode ? blueClr : mainColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                              text: rate.toString(),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          const Icon(
                            Icons.star,
                            size: 13,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
