import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../routes/route_helper.dart';
import 'auth_controller.dart';

class AccountController extends GetxController {
  void logout() {
    var authController = Get.find<AuthController>();
    if (authController.isUserLoggedIn()) {
      authController.clearSharedData();
      Get.find<CartController>().clear();
      Get.find<CartController>().clearCartHistory();
      Get.offNamed(RouteHelper.login);
    }
  }
}
