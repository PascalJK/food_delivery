import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import 'app_icon.dart';
import 'text/big.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    super.key,
    required this.iconData,
    required this.bgColor,
    required this.text,
    this.dividerHeight,
    this.onPressed,
  });
  final IconData iconData;
  final Color bgColor;
  final String text;
  final double? dividerHeight;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: onPressed,
          padding: EdgeInsets.fromLTRB(
            Dimensions.width20,
            Dimensions.width10,
            0,
            Dimensions.width10,
          ),
          child: Row(
            children: [
              AppIcon(
                icon: iconData,
                bgColor: bgColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconSize24,
                size: Dimensions.iconSize24 * 2,
              ),
              SizedBox(width: Dimensions.width10),
              BigText(text: text)
            ],
          ),
        ),
        Divider(thickness: dividerHeight ?? 1),
      ],
    );
  }
}
