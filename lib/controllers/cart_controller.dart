import 'package:food_delivery/data/repo/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  final Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    var item = CartModel(
      id: product.id,
      name: product.name,
      img: product.img,
      price: product.price,
      quantity: quantity,
      isExist: true,
      time: DateTime.now().toString()
    );
    _items.putIfAbsent(product.id!, () => item);
  }
}
