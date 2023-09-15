import 'package:flutter/material.dart';
import 'package:food_delivery/components/text/big.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: 'Cart History'),
      ),
      body: Column(),
    );
  }
}
