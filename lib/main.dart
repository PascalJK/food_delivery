import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

// Added this code to fix the HandshakeException: Handshake error in client (OS Error: CERTIFICATE_VERIFY_FAILED)
// Occurs when trying to load Network Image.
// !!!!!!!!!!!! NOT SAFE FOR PRODUCTION !!!!!!!!!!!!!!!!!
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  // Network HandshakeEX fix
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO find better solution to Builders
    return GetBuilder<PopularProductController>(
      builder: (c) {
        return GetBuilder<RecommendedProductController>(
          builder: (c) {
            return GetMaterialApp(
              theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  primaryColor: AppColors.mainColor,
                  progressIndicatorTheme: ProgressIndicatorThemeData(
                    color: AppColors.mainColor,
                  )),
              initialRoute: RouteHelper.splash,
              getPages: RouteHelper.routes,
            );
          }
        );
      }
    );
  }
}
