import 'package:food_delivery/controllers/account_controller.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repo/auth_repo.dart';
import 'package:food_delivery/data/repo/popular_product_repo.dart';
import 'package:food_delivery/data/repo/recommended_product_repo.dart';
import 'package:food_delivery/data/repo/user_repo.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repo/cart_repo.dart';

Future init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

  // repos
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), preferences: sharedPreferences));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find<ApiClient>()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find<ApiClient>()));
  Get.lazyPut(() => CartRepo(prefs: Get.find<SharedPreferences>()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find<ApiClient>()));

  // controllers
  // Get.lazyPut(() => AuthController(authRepo: Get.find<AuthRepo>()));
  Get.put(AuthController(authRepo: Get.find<AuthRepo>()));
  // Get.lazyPut(() => AccountController(userRepo: Get.find<UserRepo>()));
  Get.put(AccountController(userRepo: Get.find<UserRepo>()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find<PopularProductRepo>()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find<CartRepo>()));
}
