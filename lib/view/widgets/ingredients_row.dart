import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';

class IngredientsRow extends StatelessWidget {
  final int index;
  final Recipe recipe;

  const IngredientsRow({super.key, required this.index, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Text(
            '⚫️',
            style: TextStyle(fontSize: 10.sp),
          ),
          SizedBox(width: 12.w),
          Text(
            recipe.ingredients[index],
            style: CustomTypography.uRegular16,
          ),
        ],
      ),
    );
  }
}
