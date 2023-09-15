import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_icon.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/components/text/small.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
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
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = {};

    for (var c in getCartHistoryList) {
      if (cartItemsPerOrder.containsKey(c.time)) {
        cartItemsPerOrder.update(c.time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(c.time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() => cartItemsPerOrder.entries.map((e) => e.value).toList();

    List<int> itemsPerOrder = cartOrderTimeToList();

    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            color: AppColors.mainColor,
            padding: const EdgeInsets.only(top: 45),
            height: 100,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: 'Cart History', color: Colors.white),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined),
              ],
            ),
          ),
          Expanded(
            child: Container(
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
                    for (int i in itemsPerOrder)
                      Container(
                        height: 120,
                        margin: EdgeInsets.only(bottom: Dimensions.height20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Used to run a method inside a widget
                            /// Study this more
                            (() {
                              var d = DateFormat('yyyy-MM-dd HH:mm:ss')
                                  .parse(getCartHistoryList[listCounter].time!);
                              var f = DateFormat('MM/dd/yyyy HH:mm').format(d);
                              return BigText(text: f);
                            }()),
                            SizedBox(height: Dimensions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: List.generate(i > 3 ? 3 : i, (index) {
                                    if (listCounter < getCartHistoryList.length) {
                                      listCounter++;
                                    }
                                    return Container(
                                      height: 80,
                                      width: 80,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: Dimensions.width10 / 2),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(Dimensions.radius15 / 2),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(AppConstants.UPLOAD_URL +
                                              getCartHistoryList[listCounter - 1].img!),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                Container(
                                  height: 80,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SmallText(text: 'Total', color: AppColors.titleColor),
                                      BigText(text: '$i Items', color: AppColors.titleColor),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions.width10,
                                          vertical: Dimensions.height10 / 2,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(Dimensions.radius15 / 3),
                                          border: Border.all(width: 1, color: AppColors.mainColor),
                                        ),
                                        child:
                                            SmallText(text: 'One More', color: AppColors.mainColor),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
