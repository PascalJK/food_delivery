import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences prefs;

  CartRepo({required this.prefs});

  void addToCartList(List<CartModel> list){
    
  }
}
