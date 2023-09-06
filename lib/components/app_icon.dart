import 'package:flutter/widgets.dart';
import 'package:food_delivery/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color? bgColor;
  final Color? iconColor;
  final double? size;
  const AppIcon({
    super.key,
    required this.icon,
    this.bgColor,
    this.iconColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? Dimensions.height40,
      width: size ?? Dimensions.height40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size ?? Dimensions.height40 / 2),
        color: bgColor ?? const Color(0xfffcf4e4),
      ),
      child: Icon(
        icon,
        color: iconColor ?? const Color(0xff756d54),
        size: Dimensions.iconSize16,
      ),
    );
  }
}
