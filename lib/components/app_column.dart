import 'package:flutter/material.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/components/text/small.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'icon_text.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BigText(text: 'Bitter Orange Margarine'),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15),
              ),
            ),
            SizedBox(width: Dimensions.height10),
            const SmallText(text: '4.5'),
            const VerticalDivider(width: 10, thickness: 5, color: Colors.black),
            const Icon(Icons.comment_outlined, size: 15),
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
