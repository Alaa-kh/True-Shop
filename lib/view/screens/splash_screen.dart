import 'package:asroo_app/routes/routes.dart';
import 'package:asroo_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../widgets/text_utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 6), () => Get.offNamed(Routes.welcomeScreen));

    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
        color: mainColor,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/shopping.json',
                width: double.infinity,
                reverse: true,
                repeat: true,
                fit: BoxFit.cover),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.4),
                      blurRadius: 3,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TextUtils(
                        text: 'True',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        underline: TextDecoration.none,
                        color: Colors.white),
                    SizedBox(width: 7),
                    TextUtils(
                        text: 'Shop',
                        underline: TextDecoration.none,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ],
                )),
            const SizedBox(height: 30),
            SpinKitThreeInOut(
              color: Colors.white.withOpacity(.6),
              size: 50.0,
              delay: const Duration(milliseconds: 20),
            )
          ],
        ));
  }
}
