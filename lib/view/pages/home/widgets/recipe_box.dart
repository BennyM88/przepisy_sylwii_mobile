import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/cached_image.dart';

class RecipeBox extends StatelessWidget {
  final Recipe recipe;

  const RecipeBox({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40.w),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 280.h,
            width: 280.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: CustomColors.neutral80,
                  offset: const Offset(7, 7),
                  blurRadius: 10.r,
                  spreadRadius: 0.2.r,
                ),
              ],
            ),
            child: CachedImage(
              url: recipe.url,
              height: 280,
              width: 280,
            ),
          ),
          Positioned(
            left: 20.w,
            bottom: 25.h,
            child: Container(
              width: 240.w,
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: CustomColors.pink,
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.neutral90,
                    offset: const Offset(6, 8),
                    blurRadius: 16.r,
                    spreadRadius: 0.2.r,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    recipe.dishName,
                    style: CustomTypography.uBold18,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '"${recipe.desc}"',
                    style: CustomTypography.uRegular14n40w,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    '${recipe.time} min',
                    style: CustomTypography.uBold14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
