import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/productDetails/color_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:badges/badges.dart' as badges;

import '../../../logic/controllers/cart_controller.dart';
import '../../screens/auth/cart_screen.dart';

CarouselController carouselController = CarouselController();
final cartController = Get.find<CartController>();

int currentPage = 0;
List<Color> colorSelected = [
  kColor1,
  kColor2,
  kColor3,
  kColor4,
  kColor5,
  kColor1,
  kColor2,
  kColor3,
  kColor4,
  kColor5,
];
int currentColor = 0;

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  const ImageSliders({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<ImageSliders> createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.imageUrl),
                      fit: BoxFit.contain),
                  borderRadius: BorderRadius.circular(25)),
            );
          },
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: ((index, reason) {
                setState(() {
                  currentPage = index;
                });
              }),
              height: 600,
              autoPlay: true,
              enlargeCenterPage: true,
              pauseAutoPlayInFiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 2)),
        ),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Get.isDarkMode ? blueClr : mainColor,
                  dotColor: Colors.black),
            )),
        Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 250,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(30)),
              child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentColor = index;
                          });
                        },
                        child: ColorPicker(
                            outerBorder: currentColor == index,
                            color: colorSelected[index]),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 3,
                      ),
                  itemCount: colorSelected.length),
            )),
        Container(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Get.isDarkMode
                          ? blueClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Obx(
                () => badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -10, end: -10),
                    badgeAnimation: const badges.BadgeAnimation.slide(
                      animationDuration: Duration(milliseconds: 400),
                      colorChangeAnimationDuration: Duration(milliseconds: 400),
                      loopAnimation: false,
                      curve: Curves.easeIn,
                      colorChangeAnimationCurve: Curves.ease,
                    ),
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(CartScreen(), transition: Transition.zoom);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Get.isDarkMode
                                ? blueClr.withOpacity(0.8)
                                : mainColor.withOpacity(0.8)),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          size: 20,
                        ),
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
