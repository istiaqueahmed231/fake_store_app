import 'dart:async';

import 'package:get/get.dart';

import '../../res/routes/route_names.dart';

class SplashViewController extends GetxController {
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    // Wait for 1 second and then move to the next screen
    Timer(const Duration(seconds: 1), () {
      // Get.offNamed removes the splash screen from the navigation stack
      // so the user can't go back to it.
      Get.offNamed(RoutesNames.landingView);
    });
  }
}
