import 'package:food_delivery/models/response_model.dart';
import 'package:get/get.dart';

import '../data/repo/auth_repo.dart';
import '../models/account_model.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  final RxBool isLoading = false.obs;

  Future<ResponseModel> registration(AccountModel account) async {
    isLoading.value = true;
    var res = await authRepo.registration(account);
    late ResponseModel responseModel;
    if (res.statusCode == 200) {
      authRepo.saveUserToken(res.body['token']);
      responseModel = ResponseModel(true, res.body['token']);
    } else {
      responseModel = ResponseModel(false, res.statusText!);
    }
    isLoading.value = false;
    return responseModel;
  }
}
