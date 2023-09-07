import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/api_client.dart';
import 'package:food_delivery/data/popular_product_repo.dart';
import 'package:get/get.dart';

Future init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: 'https://mvs.bslmeiyu.com/'));

  // repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find<ApiClient>()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find<PopularProductRepo>()));
}
