import 'package:food_delivery/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences prefs;

  CartRepo({required this.prefs});
  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> list) {
    cart = [];
    var time = DateTime.now().toString();
    for (var element in list) {
      cart.add(element.copyWith(time: time).toJson());
    }
    prefs.setStringList(AppConstants.CART_LIST, cart);
  }

  void addToCartHistoryList() {
    cartHistory = prefs.getStringList(AppConstants.CART_HISTORY_LIST) ?? [];
    for (var c in cart) {
      cartHistory.add(c);
    }
    removeCart();
    prefs.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
    getCartHistoryList();
  }

  List<CartModel> getCartList() {
    List<CartModel> list = [];
    if (prefs.containsKey(AppConstants.CART_LIST)) {
      prefs.getStringList(AppConstants.CART_LIST)?.forEach((e) => list.add(CartModel.fromJson(e)));
    }
    return list;
  }

  List<CartModel> getCartHistoryList() {
    List<CartModel> list = [];
    if (prefs.containsKey(AppConstants.CART_HISTORY_LIST)) {
      prefs.getStringList(AppConstants.CART_HISTORY_LIST)?.forEach((e) {
        list.add(CartModel.fromJson(e));
      });
    }
    return list;
  }

  void removeCart() {
    cart.clear();
    prefs.remove(AppConstants.CART_LIST);
  }

  void clearCartHistory() {
    removeCart();
    prefs.remove(AppConstants.CART_HISTORY_LIST);
  }
}
