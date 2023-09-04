import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    super.key,
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.height = 1.2,
    this.size = 12,
  });
  final String text;
  final Color? color;
  final double height;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        height: height,
        fontFamily: 'Roboto',
        fontSize: size,
      ),
    );
  }
}
