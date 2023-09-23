import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/account_model.dart';
import '../api/api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences preferences;

  AuthRepo({required this.apiClient, required this.preferences});

  Future<Response> registration(AccountModel account) async =>
      await apiClient.postData(AppConstants.REGISTRATION_URI, account.toMap());

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await preferences.setString(AppConstants.TOKEN, token);
  }
}
