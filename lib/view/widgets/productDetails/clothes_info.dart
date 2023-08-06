import 'package:asroo_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import 'package:asroo_app/logic/controllers/product_controller.dart';
import 'package:asroo_app/view/widgets/text_utils.dart';

final controller = Get.find<ProductController>();

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String decription;
  const ClothesInfo({
    Key? key,
    required this.title,
    required this.productId,
    required this.rate,
    required this.decription,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Obx(() => Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? Colors.white.withOpacity(.9)
                            : Colors.grey.withOpacity(.4),
                        shape: BoxShape.circle),
                    child: InkWell(
                        onTap: () {
                          controller.manageFavorites(productId);
                        },
                        child: controller.isFavorites(productId)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 20,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: Colors.black,
                                size: 20,
                              )),
                  ))
            ],
          ),
          Row(
            children: [
              TextUtils(
                  text: '$rate',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              RatingBar(
                itemCount: 5,
                allowHalfRating: true,
                ratingWidget: RatingWidget(
                    empty: const Icon(
                      Icons.star_border,
                      color: Colors.orangeAccent,
                    ),
                    full: const Icon(Icons.star),
                    half: const Icon(Icons.star_half)),
                onRatingUpdate: (value) {
                  value = rate;
                },
                glowColor: Colors.orangeAccent,
                itemSize: 20,
              )
            ],
          ),
          const SizedBox(height: 20),
          ReadMoreText(
            decription,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Show More ',
            trimExpandedText: ' Show Less ',
            lessStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? blueClr : mainColor),
            moreStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? blueClr : mainColor),
            style: TextStyle(
                fontSize: 15,
                height: 2,
                color: Get.isDarkMode ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}
