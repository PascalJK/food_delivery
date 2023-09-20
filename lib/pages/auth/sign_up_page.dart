import 'package:flutter/material.dart';
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
          )
        ],
      ),
    );
  }
}
