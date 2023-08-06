import 'package:asroo_app/logic/bindings/auth_binding.dart';
import 'package:asroo_app/logic/bindings/product_binding.dart';
import 'package:asroo_app/view/screens/auth/login_screen.dart';
import 'package:asroo_app/view/screens/auth/signup_screen.dart';
import 'package:asroo_app/view/screens/main_screen.dart';
import 'package:asroo_app/view/screens/splash_screen.dart';

import 'package:asroo_app/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

import '../logic/bindings/main_binding.dart';
import '../view/screens/auth/cart_screen.dart';
import '../view/screens/auth/forget_password_screen.dart';
import '../view/screens/payment_screen.dart';

class AppRoutes {
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  static const splashScreen = Routes.splashScreen;
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => WelcomeScreen(),
    ),
    GetPage(name: Routes.logineScreen, page: () => LoginScreen(), bindings: [
      AuthBinding(),
      MainBinding(),
    ]),
    GetPage(
        name: Routes.signupScreen,
        page: () => SignupScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgetPasswordScreen,
        page: () => ForgetPasswordScreen(),
        binding: AuthBinding()),
    GetPage(name: Routes.mainScreen, page: () => MainScreen(), bindings: [
      AuthBinding(),
      MainBinding(),
      ProductBinding(),
    ]),
    GetPage(name: Routes.cartScreen, page: () => CartScreen(), bindings: [
      AuthBinding(),
      ProductBinding(),
    ]),
    GetPage(name: Routes.paymentScreen, page: () => PayMentScreen(), bindings: [
      AuthBinding(),
      ProductBinding(),
      MainBinding(),
    ]),
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/WelcomeScreen';
  static const logineScreen = '/LoginScreen';
  static const signupScreen = '/SignupScreen';
  static const forgetPasswordScreen = '/ForgetPasswordScreen';
  static const mainScreen = '/Maincreen';
  static const cartScreen = '/CartScreen';
  static const paymentScreen = '/PayMentScreen';
  static const splashScreen = '/SplashScreen';
}
