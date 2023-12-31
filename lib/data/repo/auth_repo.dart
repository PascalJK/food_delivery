import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/account_model.dart';
import '../api/api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences preferences;

  AuthRepo({required this.apiClient, required this.preferences});

  Future<Response> login(String email, String password) async =>
      await apiClient.postData(AppConstants.LOGIN_URI, {'email': email, 'password': password});

  Future<Response> registration(AccountModel account) async =>
      await apiClient.postData(AppConstants.REGISTRATION_URI, account.toMap());

  bool isUserLoggedin() => preferences.containsKey(AppConstants.TOKEN);

  String getUserToken() => preferences.getString(AppConstants.TOKEN) ?? 'null';

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await preferences.setString(AppConstants.TOKEN, token);
  }

  Future saveUserNumberAndPassword(String number, String password) async {
    try {
      await preferences.setString(AppConstants.PHONE, number);
      await preferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      print(e.toString());
    }
  }

  bool clearSharedData() {
    preferences.remove(AppConstants.PHONE);
    preferences.remove(AppConstants.PASSWORD);
    preferences.remove(AppConstants.TOKEN);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }
}
