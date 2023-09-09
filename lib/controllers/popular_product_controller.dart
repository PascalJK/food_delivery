import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/data/repo/popular_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get getPopularProductList => _popularProductList;

  late CartController _cartController;

  bool _isLoaded = false;
  bool get getIsLoaded => _isLoaded;

  int _cartItems = 0;
  int get getCartItems => _cartItems + _quantity;
  int _quantity = 0;
  String get getQuantity => '$_quantity';

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadPopularProductList();
  }

  Future loadPopularProductList() async {
    var response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).getProducts);
      _isLoaded = true;
      update();
    } else {
      //      throw Exception("Error");
    }
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

  void initProduct() {
    _cartItems = 0;
    _quantity = 0;
    _cartController = Get.find<CartController>();
  }

  void addCartItem(ProductModel productModel) {
    if (_quantity < 1) {
      // print error message
      return;
    }
    _cartController.addItem(productModel, _quantity);
  }
}
