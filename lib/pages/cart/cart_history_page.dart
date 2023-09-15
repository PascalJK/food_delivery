import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_icon.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({super.key});

  void loadData() {
    Get.find<CartController>().cartRepo.getCartHistoryList();
  }

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().cartRepo.getCartHistoryList();
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
              child: ListView(
                children: [
                  for (var i in itemsPerOrder)
                    Container(
                      margin: EdgeInsets.only(bottom: Dimensions.height20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: '02/12/2023'),
                          Row(
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: List.generate(itemsPerOrder[i], (index) {
                                  if (listCounter < getCartHistoryList.length) {
                                    listCounter++;
                                  }
                                  return Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(AppConstants.UPLOAD_URL +
                                            getCartHistoryList[listCounter - 1].img!),
                                      ),
                                    ),
                                  );
                                }),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
