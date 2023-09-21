import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/text/text_input_field.dart';
import 'package:food_delivery/utils/dimensions.dart';

import '../../components/text/big.dart';
import '../../utils/colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var images = ['t.png', 'f.png', 'g.png'];

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight * .05),
            // Image
            SizedBox(
              height: Dimensions.screenHeight * .25,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage('assets/image/logo part 1.png'),
                ),
              ),
            ),
            // Input-fields
            const TextInputField(controller: null, hint: 'Email', icon: Icons.email),
            SizedBox(height: Dimensions.height15),
            const TextInputField(controller: null, hint: 'Phone', icon: Icons.phone),
            SizedBox(height: Dimensions.height15),
            const TextInputField(controller: null, hint: 'Name', icon: Icons.person),
            SizedBox(height: Dimensions.height15),
            const TextInputField(controller: null, hint: 'Password', icon: Icons.password),
            // Sign up button
            SizedBox(height: Dimensions.height30),
            MaterialButton(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height20,
                vertical: Dimensions.height20,
              ),
              minWidth: Dimensions.screenWidth * .8,
              onPressed: () {},
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
      ),
    );
  }
}
