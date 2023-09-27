import 'package:food_delivery/pages/address/add_address_page.dart';
import 'package:food_delivery/pages/auth/sign_in_page.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:food_delivery/pages/splash/splash_page.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const initial = '/';
  static const splash = '/splash-page';
  static const login = '/login';
  static const register = '/register';
  static const popularFood = '/popular-food';
  static const addAddress = '/add-address';
  static const recommendedFood = '/recommended-food';
  static const cart = '/cart';

  // ignore: unnecessary_string_interpolations
  static String getInitial() => '$initial';
  static String getPopularFood(int index) => '$popularFood?item=$index';
  // ignore: unnecessary_string_interpolations
  static String getLogin() => '$login';
  // ignore: unnecessary_string_interpolations
  static String getRegister() => '$register';
  // ignore: unnecessary_string_interpolations
  static String getRecommendedFood() => '$recommendedFood';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const HomePage(),
    ),
    // Splash-Page
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    // Login-Page
    GetPage(
      name: login,
      page: () => SignInPage(),
      transition: Transition.fade,
    ),
    // Register-Page
    GetPage(
      name: register,
      page: () => SignUpPage(),
      transition: Transition.fadeIn,
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
      page: () => RecommendedFoodDetail(model: Get.arguments),
      transition: Transition.fadeIn,
    ),
    // Cart Page
    GetPage(
      name: cart,
      page: () => const CartPage(),
      transition: Transition.fadeIn,
    ),
    // Add Address Page
    GetPage(
      name: addAddress,
      page: () => const AddAddressPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
