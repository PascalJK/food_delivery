import 'package:flutter/material.dart';
import 'package:food_delivery/components/text/text_input_field.dart';
import 'package:food_delivery/utils/dimensions.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
        ],
      ),
    );
  }
}
