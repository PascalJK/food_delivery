import 'package:food_delivery/data/repo/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  final Map<int, CartModel> _items = {};
  // TODO Needed?
  Map<int, CartModel> get getItems => _items;
  List<CartModel> get getCartList => _items.entries.map((e) => e.value).toList();

  /// only for local storage cart data
  List<CartModel> storageCartList = [];

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
    cartRepo.addToCartList(getCartList);
  }

  void addToHistory() {
    cartRepo.addToCartHistoryList();
    clear();
  }

  void clear() {
    _items.clear();
    update();
  }

  void updateCartItemQty(CartModel i, int qty) {
    if (i.quantity! + qty <= 0) return;
    addItem(i.product!, i.quantity! + qty);
    update();
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

  int get getTotalPrice {
    int total = 0;
    _items.forEach((key, value) => total += value.price! * value.quantity!);
    return total;
  }

  List<CartModel> getCartData() => setCartData = cartRepo.getCartList();

  List<CartModel> getCartHistoryList() => cartRepo.getCartHistoryList();

  set setCartData(List<CartModel> items) {
    storageCartList = items;
    for (var i in storageCartList) {
      _items.putIfAbsent(i.product!.id!, () => i);
    }
  }
}
