import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late var animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  late var controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/image/logo part 1.png'),
        ],
      ),
    );
  }
}
