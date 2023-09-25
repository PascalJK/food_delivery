import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/data/repo/cart_repo.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
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

    /// Temp Code
    /// TODO:
    /// 1. Use a button/swipeview to allow the user to delete an item from cart
    /// 2. Remove this code and use the O.G code.
    if (quantity < 1) {
      tryRemoveItem(product);
    } else if (!_items.containsKey(product.id)) {
      _items.putIfAbsent(product.id!, () => p);
    } else {
      _items.update(product.id!, (value) => value.copyWith(quantity: quantity));
    }
    // O.G Code..
    // if (!_items.containsKey(product.id)) {
    //   _items.putIfAbsent(product.id!, () => p);
    // } else {
    //   _items.update(product.id!, (value) => value.copyWith(quantity: quantity));
    // }
    cartRepo.addToCartList(getCartList);
  }

  void addToCartList() {
    cartRepo.addToCartList(getCartList);
    update();
  }

  void addToHistory() {
    if (Get.find<AuthController>().isUserLoggedIn()) {
      cartRepo.addToCartHistoryList();
      clear();
    } else {
      Get.toNamed(RouteHelper.login);
    }
  }

  void clear() {
    _items.clear();
    update();
  }

  void updateCartItemQty(CartModel i, int qty) {
    // if (i.quantity! + qty <= 0) return;
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

  set setItems(Map<int, CartModel> setitems) {
    _items.clear();
    _items.addAll(setitems);
  }
}
