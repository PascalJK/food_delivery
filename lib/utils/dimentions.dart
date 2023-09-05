import 'package:get/get.dart';

class Dimentions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

// Equation == ScreenHeight / Desired Height
  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;
}
