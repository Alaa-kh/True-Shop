import 'package:asroo_app/model/product_model.dart';
import 'package:asroo_app/services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favoritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var strorage = GetStorage();

  // Search

  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    List? storedShoppings = strorage.read<List>('isFavoritesList');
    if (storedShoppings != null) {
      favoritesList = storedShoppings
          .map((value) => ProductModels.fromJson(value))
          .toList()
          .obs;
    }

    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  // Logic Favoriyes Screen

  void manageFavorites(int productId) async {
    var existingIndex =
        favoritesList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
      await strorage.remove('isFavoritesList');
    } else {
      favoritesList
          .add(productList.firstWhere((element) => element.id == productId));

      await strorage.write('isFavoritesList', favoritesList);
    }
  }

  bool isFavorites(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }

  // Search Bar Logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((value) {
      var searchTitle = value.title.toLowerCase();
      var searchPrice = value.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();

    addSearchToList('');
  }
}
