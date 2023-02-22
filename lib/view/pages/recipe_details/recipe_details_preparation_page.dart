import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/shimmer_box.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RecipeDetailsPreparationPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailsPreparationPage({super.key, required this.recipe});

  @override
  State<RecipeDetailsPreparationPage> createState() =>
      _RecipeDetailsPreparationPageState();
}

class _RecipeDetailsPreparationPageState
    extends State<RecipeDetailsPreparationPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 28.h),
              _topBar(context),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.recipe.preparation.length,
                  itemBuilder: (_, index) => _PreparationPage(
                    index: index + 1,
                    preparation: widget.recipe.preparation[index],
                    url: widget.recipe.url,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 26.sp,
          ),
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.recipe.preparation.length,
          effect: ScaleEffect(
            scale: 1.8,
            dotWidth: 7.w,
            dotHeight: 7.h,
            spacing: 15.w,
            activeDotColor: CustomColors.neutral00,
            dotColor: CustomColors.neutral90,
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
          child: Icon(
            Icons.clear,
            size: 28.sp,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class _PreparationPage extends StatelessWidget {
  final int index;
  final String preparation;
  final String url;

  const _PreparationPage({
    required this.index,
    required this.preparation,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 48.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              height: 240.h,
              width: double.infinity,
              filterQuality: FilterQuality.high,
              placeholder: (_, __) => const ShimmerBox(
                height: 380,
                width: double.infinity,
                radius: 0,
              ),
              errorWidget: (_, __, ___) => const Icon(Icons.error),
            ),
          ),
        ),
        SizedBox(height: 48.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                index.toString(),
                style: CustomTypography.uBold48,
              ),
              SizedBox(width: 20.w),
              Flexible(
                child: Text(
                  preparation,
                  style: CustomTypography.uRegular16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
