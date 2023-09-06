import 'package:flutter/widgets.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final double size;
  const AppIcon({
    super.key,
    required this.icon,
    this.bgColor = const Color(0xfffcf4e4),
    this.iconColor = const Color(0xff756d54),
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: bgColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 16,
      ),
    );
  }
}
