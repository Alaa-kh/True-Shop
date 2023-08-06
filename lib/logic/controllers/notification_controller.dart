import 'package:get/get.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotifacationsContoller extends GetxController {
  @override
  void onInit() {
    not();
    super.onInit();
  }


void not() {
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
}
}