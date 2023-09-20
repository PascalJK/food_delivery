import 'package:flutter/material.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color? bgColor;
  final Color? iconColor;
  final double? size;
  final double? iconSize;
  final bool useBadge;
  final String text;
  final Function()? onPressed;
  const AppIcon({
    super.key,
    required this.icon,
    this.bgColor,
    this.iconColor,
    this.size,
    this.iconSize,
    this.useBadge = false,
    this.text = '',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return useBadge
        ? _badgeButton()
        : SizedBox(
            height: size ?? Dimensions.height40,
            width: size ?? Dimensions.height40,
            child: _normalButton(iSize: 4));
  }

  Stack _badgeButton() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        _normalButton(),
        // Badge Widget
        if (useBadge) ...[
          IgnorePointer(
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.only(right: 8, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size ?? Dimensions.height40 / 2),
                  color: AppColors.mainColor),
              child: BigText(
                text: text,
                size: 12,
              ),
            ),
          )
        ],
      ],
    );
  }

  MaterialButton _normalButton({double iSize = 0}) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      height: size ?? Dimensions.height40,
      minWidth: size ?? Dimensions.height40,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(size ?? Dimensions.height40 / 2))),
      color: bgColor ?? const Color(0xfffcf4e4),
      onPressed: onPressed ?? () {},
      child: Center(
          child: Icon(
        icon,
        color: iconColor ?? const Color(0xff756d54),
        size: (iconSize ?? Dimensions.iconSize16) + iSize,
      )),
    );
  }
}
