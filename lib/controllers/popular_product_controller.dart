import 'package:food_delivery/data/popular_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get getPopularProductList => _popularProductList;

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
      update();
    } else {
      //      throw Exception("Error");
    }
  }
}
