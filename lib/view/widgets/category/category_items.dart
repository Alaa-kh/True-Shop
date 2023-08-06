import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:asroo_app/logic/controllers/category_controller.dart';
import 'package:asroo_app/model/product_model.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/text_utils.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../logic/controllers/product_controller.dart';
import '../../screens/product_details_screen.dart';

final controller = Get.find<ProductController>();
final cartController = Get.find<CartController>();
final categoryController = Get.find<CategoryController>();

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  const CategoryItems({
    Key? key,
    required this.categoryTitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.canvasColor,
        appBar: AppBar(
          title: Text(categoryTitle),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        ),
        body: Obx(
          () {
            if (categoryController.isAllCategory.value) {
              return Center(
                  child: CircularProgressIndicator(
                      color: Get.isDarkMode ? blueClr : mainColor));
            } else {
              return GridView.builder(
                itemCount: categoryController.categoryList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9,
                    crossAxisSpacing: 6),
                itemBuilder: (context, index) {
                  return buildCardItem(
                    image: categoryController.categoryList[index].image,
                    price: categoryController.categoryList[index].price,
                    rate: categoryController.categoryList[index].rating.rate,
                    productId: categoryController.categoryList[index].id,
                    productModels: categoryController.categoryList[index],
                    onTap: () => Get.to(
                        ProductDetailsScreen(
                          productModels: categoryController.categoryList[index],
                        ),
                        transition: Transition.leftToRight),
                  );
                },
              );
            }
          },
        ));
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
