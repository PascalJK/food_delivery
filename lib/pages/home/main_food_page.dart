import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../components/text/big.dart';
import '../../components/text/small.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class MainFoodPage extends StatelessWidget {
  const MainFoodPage({super.key});

  Future<void> _loadResources() async {
    await Future.wait([
      Get.find<PopularProductController>().loadPopularProductList(),
      Get.find<RecommendedProductController>().loadRecommendedProductList(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Content
          Container(
            margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: 'India Bangala',
                      color: AppColors.mainColor,
                    ),
                    const Row(
                      children: [
                        SmallText(
                          text: 'Suniel City',
                          color: Colors.black54,
                        ),
                        Icon(Icons.arrow_drop_down_rounded),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: Dimensions.size45,
                  height: Dimensions.size45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: AppColors.mainColor,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Dimensions.iconSize24,
                  ),
                )
              ],
            ),
          ),
          // Body Content
          Expanded(
            child: RefreshIndicator(
              onRefresh: _loadResources,
              child: const SingleChildScrollView(child: FoodPageBody()),
            ),
          ),
        ],
      ),
    );
  }
}
