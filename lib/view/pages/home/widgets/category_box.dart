import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/category_cubit/category_cubit.dart';

class CategoryBox extends StatelessWidget {
  final String categoryName;
  final CategoryState state;

  const CategoryBox({
    super.key,
    required this.categoryName,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Container(
        decoration: BoxDecoration(
          color: state.category.contains(categoryName)
              ? CustomColors.neutral00
              : CustomColors.neutral95.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Center(
            child: Text(
              categoryName,
              style: state.category.contains(categoryName)
                  ? CustomTypography.uRegular14white
                  : CustomTypography.uRegular14,
            ),
          ),
        ),
      ),
    );
  }
}
