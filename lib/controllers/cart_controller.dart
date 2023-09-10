import 'package:food_delivery/data/repo/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get getItems => _items;
  List<CartModel> get getCartList => _items.entries.map((e) => e.value).toList();

  void addItem(ProductModel product, int quantity) {
    var p = CartModel(
      id: product.id,
      name: product.name,
      img: product.img,
      price: product.price,
      quantity: quantity,
      isExist: true,
      time: DateTime.now().toString(),
      product: product,
    );

    if (!_items.containsKey(product.id)) {
      _items.putIfAbsent(product.id!, () => p);
    } else {
      _items.update(product.id!, (value) => value.copyWith(quantity: quantity));
    }
  }

  void tryRemoveItem(ProductModel product) {
    if (_items.containsKey(product.id)) {
      _items.remove(product.id);
    } else {
      // TODO toast error
    }
  }

  int getQuantity(ProductModel model) {
    int qty = 0;
    _items.forEach((key, value) {
      if (key == model.id) qty = value.quantity!;
    });
    return qty;
  }

  int getTotalQuantities() {
    int totalQuantity = 0;
    _items.forEach((key, value) => totalQuantity += value.quantity!);
    return totalQuantity;
  }
}
