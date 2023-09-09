import 'package:get/get.dart';

// import '../models/cart_model.dart';
import '../models/product_model.dart';
import 'cart_controller.dart';

class BaseController extends GetxController {
  final CartController _cartController = Get.find<CartController>();

  int _cartItems = 0;
  int _quantity = 0;

  int get getCartItems => _cartItems + _quantity;
  int get getTotalCartItemsQty => _cartController.getTotalQuantities();

  String get getQuantity => '$_quantity';

  // List<CartModel> get getCartItemsList => _cartController.getCartList;

  void initProduct(ProductModel p) {
    _cartItems = 0;
    _quantity = _cartController.getQuantity(p);
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int i) {
    if (i < 0) {
      return 0;
    } else if (i > 20) {
      return 20;
    }
    return i;
  }

  void addCartItem(ProductModel productModel) {
    if (_quantity < 1) {
      _cartController.tryRemoveItem(productModel);
    } else {
      _cartController.addItem(productModel, _quantity);
    }
    update();
  }
}
