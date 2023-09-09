import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    this.text = '', this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: size ?? Dimensions.height40,
        width: size ?? Dimensions.height40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size ?? Dimensions.height40 / 2),
          color: bgColor ?? const Color(0xfffcf4e4),
        ),
        child: Stack(
          children: [
            Center(child: _buildIcon()),
            if (useBadge) ...[
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(3),
                  margin: EdgeInsets.only(right: 3, top: 3),
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
        ),
      ),
    );
  }

  Icon _buildIcon() {
    return Icon(
      icon,
      color: iconColor ?? const Color(0xff756d54),
      size: iconSize ?? Dimensions.iconSize16,
    );
  }
}
