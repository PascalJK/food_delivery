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
            // profile icon
            AppIcon(
              icon: Icons.person,
              bgColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.accAppIconSize75,
              size: Dimensions.accAppIconSize150,
            ),
            SizedBox(height: Dimensions.height20),
            // name
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                    SizedBox(height: Dimensions.height20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
