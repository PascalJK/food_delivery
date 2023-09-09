import 'package:food_delivery/data/repo/popular_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';

import 'base_controller.dart';

class PopularProductController extends BaseController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get getPopularProductList => _popularProductList;

  bool _isLoaded = false;
  bool get getIsLoaded => _isLoaded;

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
}
