import 'package:food_delivery/models/response_model.dart';
import 'package:get/get.dart';

import '../data/repo/auth_repo.dart';
import '../models/account_model.dart';

class AuthController extends GetxController {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isloading = false;
  bool get isLoading => _isloading;

  Future<ResponseModel> registration(AccountModel account) async {
    _isloading = true;
    var res = await authRepo.registration(account);
    late ResponseModel responseModel;
    if (res.statusCode == 200) {
      authRepo.saveUserToken(res.body['token']);
      responseModel = ResponseModel(true, res.body['token']);
    } else {
      responseModel = ResponseModel(true, res.statusText!);
    }
    _isloading = false;
    update();
    return responseModel;
  }
}
