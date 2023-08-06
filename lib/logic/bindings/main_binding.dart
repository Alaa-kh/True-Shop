import 'package:asroo_app/logic/controllers/main_controller.dart';
import 'package:asroo_app/logic/controllers/payment_controller.dart';
import 'package:asroo_app/logic/controllers/settings_controller.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(PayMentController(), permanent: true);
  }
}
