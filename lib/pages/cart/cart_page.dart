import 'package:flutter/material.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/components/text/small.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
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
            left: Dimensions.width20,
            right: Dimensions.width20,
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
                      return Container(
                        height: 100,
                        width: double.maxFinite,
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Container(
                              height: Dimensions.height20 * 5,
                              width: Dimensions.height20 * 5,
                              margin: EdgeInsets.only(bottom: Dimensions.height10),
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
                                        vertical: Dimensions.height10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            // onTap: () => c.setQuantity(false),
                                            child: Icon(Icons.remove, color: AppColors.signColor),
                                          ),
                                          SizedBox(width: Dimensions.width10 / 2),
                                          BigText(text: '${item.quantity}'),
                                          SizedBox(width: Dimensions.width10 / 2),
                                          GestureDetector(
                                            // onTap: () => c.setQuantity(true),
                                            child: Icon(Icons.add, color: AppColors.signColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ))
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
