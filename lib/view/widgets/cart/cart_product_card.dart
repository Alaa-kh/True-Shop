import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:asroo_app/utils/theme.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../logic/controllers/product_controller.dart';
import '../../../model/product_model.dart';

final controller = Get.find<ProductController>();

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quantity;
  CartProductCard({
    Key? key,
    required this.productModels,
    required this.index,
    required this.quantity,
  }) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(productModels.image),
                    fit: BoxFit.contain)),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.title,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Get.isDarkMode
                                  ? blueClr.withOpacity(.2)
                                  : mainColor.withOpacity(.2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    controller
                                        .removeProductsFromCart(productModels);
                                  },
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  )),
                              Text(
                                '$quantity',
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () {
                                    controller.addProductToCart(productModels);
                                  },
                                  icon: Icon(Icons.add_circle,
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : Colors.black)),
                            ],
                          ),
                        ),
                        IconButton(
                            alignment: Alignment.centerRight,
                            onPressed: () {
                              controller.removeOneProduct(productModels);
                            },
                            icon: const Icon(
                              Icons.delete,
                              size: 20,
                              color: Colors.red,
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '\$${controller.productSubTotal[index].toStringAsFixed(2)}',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
