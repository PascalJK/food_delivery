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
  });
  final IconData iconData;
  final Color bgColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(
        Dimensions.width20,
        Dimensions.width10,
        0,
        Dimensions.width10,
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          blurRadius: 1,
          offset: const Offset(0, 2),
          color: Colors.grey.withOpacity(.2),
        ),
      ]),
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
    );
  }
}
