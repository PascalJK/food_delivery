import 'package:food_delivery/data/repo/recommended_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get getRecommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get getIsLoaded => _isLoaded;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadRecommendedProductList();
  }

  Future loadRecommendedProductList() async {
    var response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).getProducts);
      _isLoaded = true;
      update();
    } else {
      //      throw Exception("Error");
    }
  }
}
