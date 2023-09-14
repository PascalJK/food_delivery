import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late var animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  late var controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();
  final timer = Timer(const Duration(seconds: 3), () => Get.offAllNamed(RouteHelper.initial));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(child: Image.asset('assets/image/logo part 1.png', width: 250))),
          Center(child: Image.asset('assets/image/logo part 2.png', width: 250)),
        ],
      ),
    );
  }
}
