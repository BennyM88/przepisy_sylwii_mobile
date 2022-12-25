import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: SizedBox(
        height: 420.h,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) => _buildRecipeBox(),
        ),
      ),
    );
  }

  Widget _buildRecipeBox() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 32.w, 20.h),
      child: Container(
        width: 230.w,
        decoration: BoxDecoration(
          color: CustomColors.pink,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: CustomColors.neutral80,
              offset: const Offset(7, 7),
              blurRadius: 10.r,
              spreadRadius: 0.2.r,
            ),
          ],
        ),
      ),
    );
  }
}
