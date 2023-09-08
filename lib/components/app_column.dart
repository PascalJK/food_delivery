import 'package:flutter/material.dart';
import 'package:food_delivery/models/product_model.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'icon_text.dart';
import 'text/big.dart';
import 'text/small.dart';

class AppColumn extends StatelessWidget {
  final double? size;
  final ProductModel productModel;
  const AppColumn({
    super.key,
    this.size,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: productModel.name!, size: size),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: Dimensions.iconSize15,
                ),
              ),
            ),
            SizedBox(width: Dimensions.height10),
            const SmallText(text: '4.5'),
            const VerticalDivider(width: 10, thickness: 5, color: Colors.black),
            Icon(Icons.comment_outlined, size: Dimensions.iconSize15),
            const SizedBox(width: 1),
            const SmallText(text: '123'),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconText(
              icon: Icons.circle_sharp,
              text: 'Normal',
              iconColor: AppColors.iconColor1,
            ),
            IconText(
              icon: Icons.location_on,
              text: '1.7km',
              iconColor: AppColors.mainColor,
            ),
            IconText(
              icon: Icons.access_time_rounded,
              text: '32min',
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
