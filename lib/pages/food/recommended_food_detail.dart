import 'package:flutter/material.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../components/app_icon.dart';
import '../../components/text/expandable_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final ProductModel model;
  const RecommendedFoodDetail({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            expandedHeight: 300,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.yellowColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back, onPressed: () => Get.back()),
                GetBuilder<RecommendedProductController>(builder: (c) {
                  return AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    useBadge: true,
                    text: '${c.getTotalCartItemsQty}',
                  );
                }),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Center(child: BigText(text: model.name!, size: Dimensions.font26)),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.UPLOAD_URL + model.img!,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: ExpandableText(
                    text: model.description!,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<RecommendedProductController>(builder: (c) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20 * 2.5, vertical: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    iconColor: Colors.white,
                    bgColor: AppColors.mainColor,
                    icon: Icons.remove,
                    iconSize: Dimensions.iconSize24,
                    onPressed: () => c.setQuantity(false),
                  ),
                  BigText(
                    text: '\$${model.price} X ${c.getQuantity}',
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                  ),
                  AppIcon(
                    iconColor: Colors.white,
                    bgColor: AppColors.mainColor,
                    icon: Icons.add,
                    iconSize: Dimensions.iconSize24,
                    onPressed: () => c.setQuantity(true),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.height10,
                horizontal: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius20 * 2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.height20,
                      vertical: Dimensions.height20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.height20,
                      vertical: Dimensions.height20,
                    ),
                    onPressed: () => c.addCartItem(model),
                    color: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15))),
                    child: BigText(
                      text: '\$${model.price!} | Add to cart',
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
