import 'package:flutter/material.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/components/text/small.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../components/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // buttons
          Positioned(
            top: Dimensions.height40,
            left: Dimensions.height20,
            right: Dimensions.height20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back,
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                  onPressed: () => Get.back(),
                ),
                SizedBox(width: Dimensions.width20 * 5),
                AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                  onPressed: () => Get.until((route) => Get.currentRoute == RouteHelper.initial),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                  // onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
          // list view
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width10,
            right: Dimensions.width10,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (c) {
                  return ListView.builder(
                    itemCount: c.getCartList.length,
                    itemBuilder: (context, index) {
                      final item = c.getCartList[index];
                      return _cartItemView(item, c);
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (c) => Container(
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
                child: BigText(text: '\$${c.getTotalPrice}'),
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height20,
                  vertical: Dimensions.height20,
                ),
                onPressed: () => c.addToHistory(),
                color: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15))),
                child: const BigText(
                  text: 'Checkout',
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cartItemView(CartModel item, CartController c) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10 / 2),
      onPressed: () {
        // var index =
        //     Get.find<PopularProductController>().getPopularProductList.indexOf(item.product!);
        // if (index >= 0) {
        //   Get.toNamed(RouteHelper.getPopularFood(index));
        // } else if (Get.find<RecommendedProductController>()
        //     .getRecommendedProductList
        //     .contains(item.product)) {
        //   Get.toNamed(RouteHelper.recommendedFood, arguments: item.product);
        // } else {
        Get.toNamed(RouteHelper.recommendedFood, arguments: item.product);
        //   print('404 not found..');
        // }
      },
      child: Container(
        height: Dimensions.containerHieght100,
        width: double.maxFinite,
        padding: EdgeInsets.only(top: Dimensions.height10 / 5),
        child: Row(
          children: [
            Container(
              height: Dimensions.containerHieght100,
              width: Dimensions.containerHieght100,
              margin: EdgeInsets.only(bottom: Dimensions.height10 / 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(AppConstants.UPLOAD_URL + item.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: Dimensions.width10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BigText(text: item.name!),
                  SmallText(text: 'text'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(text: '\$${item.price!}'),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.height10,
                          vertical: Dimensions.height10 / 2,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.white,
                            border: Border.all(color: AppColors.mainColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => c.updateCartItemQty(item, -1),
                              child: Icon(Icons.remove, color: AppColors.signColor),
                            ),
                            SizedBox(width: Dimensions.width10 / 2),
                            BigText(text: '${item.quantity}'),
                            SizedBox(width: Dimensions.width10 / 2),
                            GestureDetector(
                              onTap: () => c.updateCartItemQty(item, 1),
                              child: Icon(Icons.add, color: AppColors.signColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
