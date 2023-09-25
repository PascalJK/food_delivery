import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/loading_indicator.dart';
import 'package:food_delivery/controllers/login_controller.dart';
import 'package:food_delivery/pages/auth/sign_up_page.dart';
import 'package:get/get.dart';

import '../../components/text/big.dart';
import '../../components/text/text_input_field.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class SignInPage extends StatelessWidget {
  final controller = LoginController();
  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.authController.isLoading.isFalse ? _mainView() : const LoadingIndicator(),
      ),
    );
  }

  SingleChildScrollView _mainView() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: Dimensions.screenHeight * .05),
          // Image
          SizedBox(
            height: Dimensions.screenHeight * .28,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: Dimensions.radius30 * 3,
                backgroundImage: const AssetImage('assets/image/logo part 1.png'),
              ),
            ),
          ),
          // welcome
          Container(
            margin: EdgeInsets.only(left: Dimensions.width20),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: Dimensions.font20 * 3 + Dimensions.font20 / 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sign into your account',
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          // Input-fields
          SizedBox(height: Dimensions.height20),
          TextInputField(controller: controller.email, hint: 'Email', icon: Icons.email),
          SizedBox(height: Dimensions.height15),
          TextInputField(
            controller: controller.password,
            hint: 'Password',
            icon: Icons.password,
            obscureText: true,
          ),
          // Sign in button
          SizedBox(height: Dimensions.height30),
          MaterialButton(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height20,
              vertical: Dimensions.height20,
            ),
            minWidth: Dimensions.screenWidth * .8,
            onPressed: () => controller.login(),
            color: AppColors.mainColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15))),
            child: const BigText(
              text: 'Sign in',
              color: Colors.white,
            ),
          ),
          // forgot password
          SizedBox(height: Dimensions.height15),
          Padding(
            padding: EdgeInsets.only(right: Dimensions.width15),
            child: Align(
              alignment: Alignment.topRight,
              child: RichText(
                text: TextSpan(
                  text: 'Forgot Password?',
                  recognizer: TapGestureRecognizer()..onTap = () => print('tap'),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font17,
                  ),
                ),
              ),
            ),
          ),
          // Sign up options
          SizedBox(height: Dimensions.screenHeight * .03),
          RichText(
            text: TextSpan(
                text: 'Don\'t have an account? ',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => SignUpPage(), transition: Transition.fade),
                    text: 'Create',
                    style: TextStyle(
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.font20,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
          SizedBox(height: Dimensions.screenHeight * .05),
        ],
      ),
    );
  }
}
