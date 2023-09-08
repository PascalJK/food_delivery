import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const initial = '/';
  static const popularFood = '/popular-food';
  static const recommendedFood = '/recommended-food';

  // ignore: unnecessary_string_interpolations
  static String getInitial() => '$initial';
  static String getPopularFood(int index) => '$popularFood?item=$index';
  // ignore: unnecessary_string_interpolations
  static String getRecommendedFood() => '$recommendedFood';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const MainFoodPage(),
    ),
    // Popular Food Detail
    GetPage(
      name: popularFood,
      page: () {
        var i = Get.parameters['item'];
        return PopularFoodDetail(productModel: int.parse(i!));
      },
      transition: Transition.fadeIn,
    ),
    // Recommended Food Detail
    GetPage(
      name: recommendedFood,
      page: () => const RecommendedFoodDetail(),
      transition: Transition.fadeIn,
    ),
  ];
}
