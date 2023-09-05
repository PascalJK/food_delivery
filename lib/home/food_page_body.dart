import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/icon_text.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/components/text/small.dart';
import 'package:food_delivery/utils/colors.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final pageController = PageController(viewportFraction: .85);
  var _currentPageValue = 0.0;
  var _scaleFactor = .8;
  var _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView
        Container(
          height: 320,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, index) {
              return _buildPageItem(index);
            },
          ),
        ),
        // Indicator
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue.toInt(),
          decorator: DotsDecorator(
            size: const Size.square(9),
            activeColor: AppColors.mainColor,
            activeSize: const Size(18, 9),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    var matrix = Matrix4.identity();
    // Current Item (inFocus)
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    }
    // Right Item
    else if (index == _currentPageValue.floor() + 1) {
      var currentScale = _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    }
    // Left Item
    else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTrans, 0);
    }
    // Apply to other unfocused items
    else {
      var currentTrans = _height * (1 - _scaleFactor) / 2;
      matrix = Matrix4.diagonal3Values(1, _scaleFactor, 1)..setTranslationRaw(0, currentTrans, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? const Color(0xff69c5df) : const Color(0xff9294cc),
              image: const DecorationImage(
                image: AssetImage('assets/image/food0.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Color(0xffe8e8e8), blurRadius: 3, offset: Offset(0, 5)),
                    // BoxShadow(color: Colors.white, blurRadius: 5, offset: Offset(-5, 0)),
                    // BoxShadow(color: Colors.white, blurRadius: 5, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BigText(text: 'Bitter Orange Margarine'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const SmallText(text: '4.5'),
                        const VerticalDivider(width: 10, thickness: 5, color: Colors.black),
                        const Icon(Icons.comment_outlined, size: 15),
                        const SizedBox(width: 1),
                        const SmallText(text: '123'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconText(
                          icon: Icons.circle_sharp,
                          text: 'Normal',
                          iconColor: AppColors.iconColor1,
                        ),
                        IconText(
                          icon: Icons.location_on,
                          text: '1.7km',
                          iconColor: AppColors.mainColor,
                        ),
                        IconText(
                          icon: Icons.access_time_rounded,
                          text: '32min',
                          iconColor: AppColors.iconColor2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}