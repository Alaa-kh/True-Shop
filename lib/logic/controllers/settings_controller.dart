import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/my_string.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  String langLocal = ene;

  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

  //Language

  @override
  void onInit() async {
    super.onInit();
    try {
      langLocal = await getLanguage;
    } catch (e) {
      print('object = $e');
    }
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  get getLanguage async {
    return await storage.read("lang");
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }

    if (typeLang == fra) {
      langLocal = fra;
      saveLanguage(fra);
    } else if (typeLang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
