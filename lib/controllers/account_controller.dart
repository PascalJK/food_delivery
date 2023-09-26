import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/models/account_model.dart';
import 'package:get/get.dart';

import '../data/repo/user_repo.dart';
import '../models/response_model.dart';
import '../routes/route_helper.dart';
import 'auth_controller.dart';

class AccountController extends GetxController {
  final UserRepo userRepo;
  late AccountModel _accountModel;
  AccountModel get getAccountModel => _accountModel;

  final RxBool isLoading = false.obs;

  AccountController(this.userRepo);

  Future<ResponseModel> getUserInfo() async {
    isLoading.value = true;
    var res = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (res.statusCode == 200) {
      _accountModel = AccountModel.fromMap(res.body);
      responseModel = ResponseModel(true, 'passed');
    } else {
      responseModel = ResponseModel(false, res.statusText!);
    }
    isLoading.value = false;
    return responseModel;
  }

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
