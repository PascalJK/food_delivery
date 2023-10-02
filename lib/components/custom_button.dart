import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool transparent;
  final String text;
  final EdgeInsets margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final IconData? icon;
  const CustomButton({
    super.key,
    this.onPressed,
    this.transparent = false,
    required this.text,
    this.margin = EdgeInsets.zero,
    this.height,
    this.width,
    this.fontSize,
    this.radius,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var btnStyle = TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? context.theme.disabledColor
          : transparent
              ? Colors.transparent
              : AppColors.mainColor,
      minimumSize: Size(width ?? Dimensions.screenWidth, height ?? 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? Dimensions.radius5),
      ),
    );
    return Center(
      child: SizedBox(
        width: width ?? Dimensions.screenWidth,
        height: height ?? 50,
        child: TextButton(
            onPressed: onPressed,
            style: btnStyle,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon != null
                    ? Padding(
                        padding: EdgeInsets.only(right: Dimensions.width10 / 2),
                        child: Icon(
                          icon,
                          color: transparent ? context.theme.primaryColor : context.theme.cardColor,
                        ),
                      )
                    : const SizedBox(),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize ?? Dimensions.font17,
                    color: transparent ? context.theme.primaryColor : context.theme.cardColor,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
