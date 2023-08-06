import 'package:asroo_app/view/screens/category_screen.dart';
import 'package:asroo_app/view/screens/favorite_screen.dart';
import 'package:asroo_app/view/screens/home_screen.dart';
import 'package:asroo_app/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ].obs;

  final title = [
    'True Shop',
    'Categorise',
    'Favorites',
    'Settings',
  ].obs;
}
