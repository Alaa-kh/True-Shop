import 'package:asroo_app/routes/routes.dart';
import 'package:asroo_app/utils/my_string.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'languages/localization.dart';
import 'logic/controllers/theme_controller.dart';
import 'notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationServices.initializenoti();
  await GetStorage.init();
  await Firebase.initializeApp();

  runApp(MyShop());
}

class MyShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(GetStorage().read<String>('lang').toString()),
      fallbackLocale: Locale(ene),
      translations: LocaliztionApp(),
      title: 'True Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? Routes.splashScreen
          : Routes.mainScreen,
      getPages: AppRoutes.routes,
    );
  }
}
