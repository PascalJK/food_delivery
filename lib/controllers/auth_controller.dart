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

  Future<ResponseModel> login(String email, String password) async {
    isLoading.value = true;
    var res = await authRepo.login(email, password);
    late ResponseModel responseModel;
    if (res.statusCode == 200) {
      authRepo.saveUserToken(res.body['token']);
      authRepo.saveUserNumberAndPassword(email, password);
      responseModel = ResponseModel(true, res.body['token']);
    } else {
      responseModel = ResponseModel(false, res.statusText!);
    }
    isLoading.value = false;
    return responseModel;
  }
}
