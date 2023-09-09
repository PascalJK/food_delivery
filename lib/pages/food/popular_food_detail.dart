import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_column.dart';
import 'package:food_delivery/components/app_icon.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/components/text/expandable_text.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int productModel;
  const PopularFoodDetail({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PopularProductController>();
    var item = controller.getPopularProductList[productModel];
    controller.initProduct(item);

    return Scaffold(
      body: Stack(
        children: [
          // Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.popularFoodImgSize,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.UPLOAD_URL + item.img!),
                ),
              ),
            ),
          ),
          // Buttons
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width15,
            right: Dimensions.width15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back, onPressed: () => Get.back()),
                GetBuilder<PopularProductController>(builder: (c) {
                  return AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    useBadge: true,
                    text: '${c.getTotalCartItemsQty}',
                    onPressed: () => Get.toNamed(RouteHelper.cart),
                  );
                }),
              ],
            ),
          ),
          // Details
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 15,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    size: Dimensions.font26,
                    productModel: item,
                  ),
                  SizedBox(height: Dimensions.height10),
                  const BigText(text: 'Introduce'),
                  SizedBox(height: Dimensions.height15),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(text: item.description!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (c) {
        return Container(
          height: Dimensions.bottomBarHeight,
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.height20,
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
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => c.setQuantity(false),
                      child: Icon(Icons.remove, color: AppColors.signColor),
                    ),
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(text: c.getQuantity),
                    SizedBox(width: Dimensions.width10 / 2),
                    GestureDetector(
                      onTap: () => c.setQuantity(true),
                      child: Icon(Icons.add, color: AppColors.signColor),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.height20,
                  vertical: Dimensions.height20,
                ),
                onPressed: () => c.addCartItem(item),
                color: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15))),
                child: BigText(
                  text: '\$${item.price!} | Add to cart',
                  color: Colors.white,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
