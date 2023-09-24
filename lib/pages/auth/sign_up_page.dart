import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/loading_indicator.dart';
import 'package:food_delivery/components/text/text_input_field.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../components/text/big.dart';
import '../../controllers/sign_up_controller.dart';
import '../../utils/colors.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final controller = SignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.authController.isLoading.isFalse ? _mainView() : const LoadingIndicator(),
      ),
    );
  }

  SingleChildScrollView _mainView() {
    var images = ['t.png', 'f.png', 'g.png'];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: Dimensions.screenHeight * .05),
          // Image
          SizedBox(
            height: Dimensions.screenHeight * .25,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: Dimensions.radius20 * 4,
                backgroundImage: const AssetImage('assets/image/logo part 1.png'),
              ),
            ),
          ),
          // Input-fields
          TextInputField(controller: controller.email, hint: 'Email', icon: Icons.email),
          SizedBox(height: Dimensions.height15),
          TextInputField(controller: controller.contact, hint: 'Phone', icon: Icons.phone),
          SizedBox(height: Dimensions.height15),
          TextInputField(controller: controller.name, hint: 'Name', icon: Icons.person),
          SizedBox(height: Dimensions.height15),
          TextInputField(
            controller: controller.password,
            hint: 'Password',
            icon: Icons.password,
            obscureText: true,
          ),
          // Sign up button
          SizedBox(height: Dimensions.height30),
          MaterialButton(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height20,
              vertical: Dimensions.height20,
            ),
            minWidth: Dimensions.screenWidth * .8,
            onPressed: () => controller.registration(),
            color: AppColors.mainColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius15))),
            child: const BigText(
              text: 'Sign up',
              color: Colors.white,
            ),
          ),
          // already has account text
          SizedBox(height: Dimensions.height15),
          RichText(
            text: TextSpan(
              text: 'Already have an account?',
              recognizer: TapGestureRecognizer()..onTap = () => print('tap'),
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: Dimensions.font17,
              ),
            ),
          ),
          // Sign up options
          SizedBox(height: Dimensions.screenHeight * .03),
          RichText(
            text: TextSpan(
              text: 'Sign up using one of the following methods',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: Dimensions.font12,
              ),
            ),
          ),
          SizedBox(height: Dimensions.screenHeight * .05),
          Wrap(
            children: List.generate(
              images.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CircleAvatar(
                  radius: Dimensions.radius20 + 5,
                  backgroundImage: AssetImage('assets/image/${images[index]}'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
