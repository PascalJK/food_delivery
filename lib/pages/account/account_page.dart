import 'package:flutter/material.dart';
import 'package:food_delivery/components/account_widget.dart';
import 'package:food_delivery/components/app_icon.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        margin: EdgeInsets.only(top: Dimensions.height15),
        width: double.maxFinite,
        child: Column(
          children: [
            
            AppIcon(
              icon: Icons.person,
              bgColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.accAppIconSize75,
              size: Dimensions.accAppIconSize150,
            ),
            SizedBox(height: Dimensions.height20),
            const AccountWidget(
              iconData: Icons.account_circle_outlined,
              bgColor: Colors.blueAccent,
              text: 'Suniel Lionel Jobbs',
            ),
            SizedBox(height: Dimensions.height10),
            const AccountWidget(
              iconData: Icons.account_circle_outlined,
              bgColor: Colors.blueAccent,
              text: 'Testing Fire Close',
            ),
          ],
        ),
      ),
    );
  }
}
