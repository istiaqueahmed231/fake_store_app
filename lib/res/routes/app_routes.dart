import 'package:fake_store/res/routes/route_names.dart';
import 'package:fake_store/views/landing_view.dart';
import 'package:fake_store/views/product_info_view.dart';
import 'package:get/get.dart';

import '../../views/splash_view.dart';


class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RoutesNames.splashView,
      page: () =>  SplashView(),
      transition: Transition.fadeIn, // Adds a smooth feel
    ),
    GetPage(
      name: RoutesNames.landingView,
      page: () => LandingView(),
      transition: Transition.rightToLeftWithFade,
    ),

    GetPage(
      name: RoutesNames.productInfoView,
      page: () => ProductInfoView(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}