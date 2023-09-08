import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_column.dart';
import 'package:food_delivery/components/icon_text.dart';
import 'package:food_delivery/components/text/big.dart';
import 'package:food_delivery/components/text/small.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

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
        GetBuilder<PopularProductController>(
            // init: ,
            builder: (c) {
          return Container(
            height: Dimensions.pageView,
            child: c.getIsLoaded
                ? PageView.builder(
                    controller: pageController,
                    itemCount: c.getPopularProductList.length,
                    itemBuilder: (context, index) {
                      return _buildPopularProductItem(c.getPopularProductList[index], index);
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          );
        }),
        // Indicator
        GetBuilder<PopularProductController>(builder: (c) {
          return DotsIndicator(
            dotsCount: c.getPopularProductList.isEmpty ? 1 : c.getPopularProductList.length,
            position: _currentPageValue.toInt(),
            decorator: DotsDecorator(
              size: const Size.square(9),
              activeColor: AppColors.mainColor,
              activeSize: const Size(18, 9),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        }),
        // recommended text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(text: 'Recommended'),
              Container(
                  child: const BigText(
                text: ' :Food Pairing',
                color: Colors.black26,
              )),
            ],
          ),
        ),
        // List of recommended food
        GetBuilder<RecommendedProductController>(builder: (c) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: c.getRecommendedProductList.length,
            itemBuilder: (context, index) {
              return _buildRecommendedProductItem(c.getRecommendedProductList[index]);
            },
          );
        })
      ],
    );
  }

  Container _buildRecommendedProductItem(ProductModel model) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.width30,
        right: Dimensions.width30,
        bottom: Dimensions.height10,
      ),
      child: InkWell(
        onTap: () => Get.toNamed(RouteHelper.getRecommendedFood(), arguments: model),
        child: Row(
          children: [
            // Image section
            Container(
              height: Dimensions.listViewImgSize,
              width: Dimensions.listViewImgSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white38,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.UPLOAD_URL + model.img!),
                ),
              ),
            ),
            // text content
            Expanded(
              child: Container(
                height: Dimensions.listTextContainerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(text: model.name!),
                      SizedBox(height: Dimensions.height10),
                      const SmallText(text: 'With Chinese charateristics'),
                      SizedBox(height: Dimensions.height10),
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
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPopularProductItem(ProductModel model, int index) {
    // #region Matrix Logic
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
    // #endregion

    return Transform(
      transform: matrix,
      child: InkWell(
        onTap: () => Get.toNamed(RouteHelper.getPopularFood(index)),
        child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven ? const Color(0xff69c5df) : const Color(0xff9294cc),
                image: DecorationImage(
                  image: NetworkImage(AppConstants.UPLOAD_URL + model.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Color(0xffe8e8e8), blurRadius: 3, offset: Offset(0, 5)),
                      // BoxShadow(color: Colors.white, blurRadius: 5, offset: Offset(-5, 0)),
                      // BoxShadow(color: Colors.white, blurRadius: 5, offset: Offset(5, 0)),
                    ]),
                child: Container(
                    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: AppColumn(productModel: model)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
