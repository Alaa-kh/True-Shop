import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asroo_app/model/product_model.dart';

import '../widgets/productDetails/add_cart.dart';
import '../widgets/productDetails/clothes_info.dart';
import '../widgets/productDetails/image_sliders.dart';
import '../widgets/productDetails/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
   ProductDetailsScreen({
    Key? key,
    required this.productModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.canvasColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productModels.image,
              ),
              ClothesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                decription: productModels.description,
              ),
              SizeList(),
              AddCart(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
