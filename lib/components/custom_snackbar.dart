import 'package:flutter/material.dart';
import 'package:food_delivery/components/text/big.dart';
// import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message, {bool isError = true, String title = 'Error'}) {
  Get.snackbar(
    title,
    message,
    titleText: BigText(
      text: title,
      color: Colors.white,
    ),
    messageText: Text(message, style: const TextStyle(color: Colors.white)),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.redAccent,
    // backgroundColor: isError ? Colors.redAccent : AppColors.mainColor,
    dismissDirection: DismissDirection.horizontal,
  );
}
