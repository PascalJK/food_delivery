import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    super.key,
    required this.text,
    this.color,
    this.height,
    this.size,
  });
  final String text;
  final Color? color;
  final double? height;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? const Color(0xFFccc7c5),
        height: height ?? 1.2,
        fontFamily: 'Roboto',
        fontSize: size ?? 12,
      ),
    );
  }
}
