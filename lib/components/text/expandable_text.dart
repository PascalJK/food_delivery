import 'package:flutter/material.dart';
import 'package:food_delivery/components/text/small.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          child: secondHalf.isEmpty
              ? SmallText(
                  text: firstHalf,
                  size: Dimensions.font17,
                )
              : Column(
                  children: [
                    SmallText(
                      text: hiddenText
                          ? '$firstHalf...'
                          : firstHalf + secondHalf + firstHalf + secondHalf,
                      size: Dimensions.font17,
                    ),
                    InkWell(
                      onTap: () => setState(() => hiddenText = !hiddenText),
                      child: Row(
                        children: [
                          SmallText(
                            text: hiddenText ? 'Show more' : 'Show less',
                            color: AppColors.mainColor,
                          ),
                          Icon(
                            hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
