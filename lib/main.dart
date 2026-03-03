import 'package:fake_store/res/routes/app_routes.dart';
import 'package:fake_store/res/routes/route_names.dart';
import 'package:fake_store/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //home: SplashView(),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesNames.splashView,  //always use named routes
      getPages: AppRoutes.appRoutes(),  //linking routes to list
      title: 'Fake Store',
    );


  }
}

