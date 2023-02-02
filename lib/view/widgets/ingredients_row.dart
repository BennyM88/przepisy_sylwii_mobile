import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';

class IngredientsRow extends StatelessWidget {
  final int index;
  final Recipe recipe;

  const IngredientsRow({super.key, required this.index, required this.recipe});
  //TODO refactor UI
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        decoration: BoxDecoration(
          color: CustomColors.neutral99,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: Text(
          recipe.ingredients[index],
          style: CustomTypography.uRegular16,
        ),
      ),
    );
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Row(
    //       children: [
    //         Text(
    //           recipe.ingredients[index],
    //           style: CustomTypography.uRegular16,
    //         ),
    //       ],
    //     ),
    //     const Divider(),
    //   ],
    // );
  }
}
