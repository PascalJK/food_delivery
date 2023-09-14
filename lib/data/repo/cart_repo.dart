import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences prefs;

  CartRepo({required this.prefs});
  List<String> cart = [];

  void addToCartList(List<CartModel> list) {
    cart = [];
    for (var element in list) {
      cart.add(element.toJson());
    }
    prefs.setStringList('Cart-list', cart);
  }
}
