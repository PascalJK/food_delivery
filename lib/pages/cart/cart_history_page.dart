import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_icon.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/components/text/small.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/models/cart_model.dart';
import 'package:food_delivery/pages/base/no_data_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({super.key});

  void loadData() {
    Get.find<CartController>().cartRepo.getCartHistoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            color: AppColors.mainColor,
            padding: EdgeInsets.only(top: Dimensions.height45),
            height: Dimensions.containerHieght100,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: 'Cart History', color: Colors.white),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<CartController>(builder: (c) {
              // #region Temp Code
              /// TODO: Create a Order Model
              var getCartHistoryList = c.getCartHistoryList().reversed.toList();
              Map<String, int> cartItemsPerOrder = {};
              print(getCartHistoryList.length);
              for (var c in getCartHistoryList) {
                if (cartItemsPerOrder.containsKey(c.time)) {
                  cartItemsPerOrder.update(c.time!, (value) => ++value);
                } else {
                  cartItemsPerOrder.putIfAbsent(c.time!, () => 1);
                }
              }

              List<int> cartItemsPerOrderToList() =>
                  cartItemsPerOrder.entries.map((e) => e.value).toList();

              List<String> cartOrderTimeToList() =>
                  cartItemsPerOrder.entries.map((e) => e.key).toList();

              List<int> itemsPerOrder = cartItemsPerOrderToList();

              var listCounter = 0;

              Widget timeWidget(int index) {
                String date = '---';
                if (index < getCartHistoryList.length) {
                  var d = DateFormat('yyyy-MM-dd HH:mm:ss')
                      .parse(getCartHistoryList[listCounter].time!);
                  date = DateFormat('MM/dd/yyyy HH:mm').format(d);
                }
                return BigText(text: date);
              }
              // #endregion

              return getCartHistoryList.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.height20,
                        right: Dimensions.width20,
                        left: Dimensions.width20,
                      ),
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView(
                          children: [
                            for (int i = 0; i < itemsPerOrder.length; i++)
                              InkWell(
                                onTap: () {
                                  var ot = cartOrderTimeToList()[i];
                                  Map<int, CartModel> ordersMap = {};
                                  for (var o in getCartHistoryList) {
                                    if (o.time! == ot) {
                                      ordersMap.putIfAbsent(o.id!, () => o);
                                    }
                                  }
                                  c.setItems = ordersMap;
                                  c.addToCartList();
                                  Get.toNamed(RouteHelper.cart);
                                },
                                child: Container(
                                  height: Dimensions.containerHieght120,
                                  margin: EdgeInsets.only(bottom: Dimensions.height20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      timeWidget(listCounter),
                                      SizedBox(height: Dimensions.height10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Wrap(
                                            direction: Axis.horizontal,
                                            children: List.generate(
                                                itemsPerOrder[i] > 3 ? 3 : itemsPerOrder[i],
                                                (index) {
                                              if (listCounter < getCartHistoryList.length) {
                                                listCounter++;
                                              }
                                              return Container(
                                                height: Dimensions.imgSize80,
                                                width: Dimensions.imgSize80,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: Dimensions.width10 / 2),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                      Dimensions.radius15 / 2),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(AppConstants.UPLOAD_URL +
                                                        getCartHistoryList[listCounter - 1].img!),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                          SizedBox(
                                            height: Dimensions.imgSize80,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SmallText(
                                                    text: 'Total', color: AppColors.titleColor),
                                                BigText(
                                                  text: '${itemsPerOrder[i]} Items',
                                                  color: AppColors.titleColor,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: Dimensions.width10,
                                                    vertical: Dimensions.height10 / 2,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(
                                                        Dimensions.radius15 / 3),
                                                    border: Border.all(
                                                        width: 1, color: AppColors.mainColor),
                                                  ),
                                                  child: SmallText(
                                                      text: 'One More', color: AppColors.mainColor),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    )
                  : const NoDataPage(text: 'You haven\'t made any purchases yet.');
            }),
          ),
        ],
      ),
    );
  }
}
