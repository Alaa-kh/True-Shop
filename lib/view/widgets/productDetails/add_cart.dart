import 'package:asroo_app/logic/controllers/cart_controller.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:asroo_app/model/product_model.dart';
import 'package:asroo_app/view/widgets/text_utils.dart';

final controller = Get.find<CartController>();

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
  const AddCart({
    Key? key,
    required this.price,
    required this.productModels,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(
                  text: 'Price',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              Text(
                '\$$price',
                style: TextStyle(
                    height: 1.5,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
                      backgroundColor: Get.isDarkMode ? blueClr : mainColor),
                  onPressed: () {
                    controller.addProductToCart(productModels);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Add To Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.shopping_basket_outlined)
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
