import 'package:flutter/material.dart';
import 'package:food_delivery/components/account_widget.dart';
import 'package:food_delivery/components/app_icon.dart';
import 'package:food_delivery/components/loading_indicator.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/account_controller.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isUserLoggedIn = Get.find<AuthController>().isUserLoggedIn();
    if (isUserLoggedIn) Get.find<AccountController>().getUserInfo();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: const BigText(
          text: 'Profile',
          color: Colors.white,
          size: 24,
        ),
      ),
      body: GetBuilder<AccountController>(builder: (c) {
        return !isUserLoggedIn
            ? const Center(child: Text('Logged in u must be to access this page!'))
            : Obx(() => c.isLoading.isFalse ? _isRegisteredView(c) : const LoadingIndicator());
      }),
    );
  }

  Container _isRegisteredView(AccountController controller) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.height15),
      width: double.maxFinite,
      child: Column(
        children: [
          // profile icon
          AppIcon(
            icon: Icons.person,
            bgColor: AppColors.mainColor,
            iconColor: Colors.white,
            iconSize: Dimensions.accAppIconSize75,
            size: Dimensions.accAppIconSize150,
          ),
          SizedBox(height: Dimensions.height20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // name
                  AccountWidget(
                    iconData: Icons.account_circle_outlined,
                    bgColor: AppColors.mainColor,
                    text: 'Suniel Lionel Jobbs',
                  ),
                  SizedBox(height: Dimensions.height10),
                  // phone
                  const AccountWidget(
                    iconData: Icons.phone_outlined,
                    bgColor: Colors.blueAccent,
                    text: '+(264)817201880',
                  ),
                  SizedBox(height: Dimensions.height20),
                  // email
                  AccountWidget(
                    iconData: Icons.email_outlined,
                    bgColor: AppColors.yellowColor,
                    text: 'jokingsuniel@india.bangala',
                  ),
                  SizedBox(height: Dimensions.height20),
                  // address
                  const AccountWidget(
                    iconData: Icons.location_on_outlined,
                    bgColor: Colors.orangeAccent,
                    text: 'Filling your address',
                  ),
                  SizedBox(height: Dimensions.height20),
                  // message
                  const AccountWidget(
                    iconData: Icons.message_outlined,
                    bgColor: Colors.greenAccent,
                    text: 'Messages',
                  ),
                  Divider(height: Dimensions.height20, thickness: Dimensions.height15),
                  // logout
                  InkWell(
                    onTap: () => controller.logout(),
                    child: const AccountWidget(
                      iconData: Icons.logout,
                      bgColor: Colors.redAccent,
                      text: 'Logout',
                    ),
                  ),
                  SizedBox(height: Dimensions.height20 * 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
