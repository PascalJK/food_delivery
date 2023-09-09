import 'package:flutter/material.dart';
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
          Positioned(
            top: Dimensions.height20 * 3,
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
                  onPressed: () => Get.back(),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
