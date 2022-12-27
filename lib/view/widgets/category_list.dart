import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/category_list.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: SizedBox(
        height: 36.h,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (_, index) => _buildCategoryBox(categoryList[index]),
        ),
      ),
    );
  }

  Widget _buildCategoryBox(String categoryName) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.neutral95.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Center(
            child: Text(
              categoryName,
              style: CustomTypography.uRegular14,
            ),
          ),
        ),
      ),
    );
  }
}
