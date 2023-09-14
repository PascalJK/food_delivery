import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

// Equation == ScreenHeight / Desired Height
  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

// dynamic height padding + margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height40 = screenHeight / 19.94;
  static double height45 = screenHeight / 18.76;

// dynamic width padding + margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

  static double size45 = screenHeight / 18.76;

// radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  // icon size
  static double iconSize15 = screenHeight / 56.27;
  static double iconSize16 = screenHeight / 52.75;
  static double iconSize24 = screenHeight / 35.17;

  static double font12 = screenHeight / 66.48;
  static double font17 = screenHeight / 46.92;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  // list view size
  static double listViewImgSize = screenWidth / 3.25;
  static double listTextContainerSize = screenWidth / 3.9;

  // popular food detail
  static double popularFoodImgSize = screenHeight / 2.41;
  static double bottomBarHeight = screenHeight / 7.03;

  // splash screen
  static double splashImgWidthSize = screenHeight / 3.38;
}
