import 'package:food_delivery/data/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get getPopularProductList => _popularProductList;

  Future loadPopularProductList() async {
    var response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      update();
    } else {
      //      throw Exception("Error");
    }
  }
}
