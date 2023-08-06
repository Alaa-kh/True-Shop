import 'package:asroo_app/logic/controllers/product_controller.dart';
import 'package:asroo_app/view/widgets/home/card_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class FavoriteScreen extends StatelessWidget {
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: Obx(() {
        if (controller.favoritesList.isEmpty) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  child: Lottie.asset('assets/animations/favorite.json',
                      width: 300,
                      reverse: true,
                      repeat: true,
                      fit: BoxFit.cover)),
              Text(
                'Please, Add Your Favorite Products',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              )
            ],
          ));
        } else {
          return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItem(
                  image: controller.favoritesList[index].image,
                  price: controller.favoritesList[index].price,
                  title: controller.favoritesList[index].title,
                  productid: controller.favoritesList[index].id,
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.grey,
                  thickness: 1,
                );
              },
              itemCount: controller.favoritesList.length);
        }
      }),
    );
  }
}

Widget buildFavItem(
    {required String image,
    required double price,
    required String title,
    required int productid}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          SizedBox(
            child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      image,
                      fit: BoxFit.contain,
                    ))),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(height: 10),
                Text(
                  price.toString(),
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                controller.manageFavorites(productid);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ))
        ],
      ),
    ),
  );
}
