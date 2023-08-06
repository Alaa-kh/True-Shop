import 'package:asroo_app/utils/theme.dart';
import 'package:asroo_app/view/widgets/category/category_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/category_controller.dart';

class CategoryWidget extends StatelessWidget {
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCategoryLoading.value) {
        return CircularProgressIndicator(
          color: Get.isDarkMode ? blueClr : mainColor,
        );
      } else {
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: controller.categoryNameList.length,
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  controller.getCategoryIndex(index);
                  Get.to(
                      () => CategoryItems(
                          categoryTitle: controller.categoryNameList[index]),
                      transition: Transition.circularReveal);
                },
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          alignment: Alignment.bottomRight,
                          image: NetworkImage(controller.imageCategory[index]),
                          fit: BoxFit.contain),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        controller.categoryNameList[index],
                        style: TextStyle(
                            backgroundColor: Colors.grey.withOpacity(.2),
                            color: Get.isDarkMode ? blueClr : mainColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )),
          ),
        );
      }
    });
  }
}
