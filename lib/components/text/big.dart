import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.overflow = TextOverflow.ellipsis,
  });
  final String text;
  final Color? color;
  final double? size;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color ?? const Color(0xFF332d2b),
        fontFamily: 'Roboto',
        fontSize: size ?? Dimensions.font20,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
