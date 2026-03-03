import 'package:fake_store/res/assets/image_assets.dart';
import 'package:fake_store/view_models/controllers/splash_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  final SplashViewController splashViewController=Get.put(SplashViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: FadeTransition(child: ,),

      body: Center(
        child: Image.asset(ImageAssets.splash_screen_logo,height: 200,width: 180,fit: BoxFit.contain,),
      ),
    );
  }
}
