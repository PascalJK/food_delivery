import 'package:flutter/material.dart';
import 'package:food_delivery/components/text/big.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: 'Profile',
          size: 24,
        ),
      ),
    );
  }
}
