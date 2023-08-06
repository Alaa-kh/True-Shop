import 'package:asroo_app/logic/controllers/product_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFromText extends StatelessWidget {
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (_) => TextField(
              controller: controller.searchTextController,
              onChanged: (searchName) {
                controller.addSearchToList(searchName);
              },
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Search With Name Or Price",
                  hintStyle: const TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  fillColor: Colors.white,
                  focusColor: Colors.red,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: controller.searchTextController.text.isEmpty
                      ? null
                      : IconButton(
                          onPressed: () {
                            controller.clearSearch();
                          },
                          icon: const Icon(Icons.close, color: Colors.black))),
            ));
  }
}
