import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/view/pages/recipe_details_page.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: SizedBox(
        height: 390.h,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () async => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RecipeDetailsPage(),
              ),
            ),
            child: _buildRecipeBox(),
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeBox() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 40.w, 0),
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                'assets/images/suflet.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 20.w,
            bottom: 25.h,
            child: Container(
              width: 240.w,
              height: 130.h,
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: CustomColors.pink,
                borderRadius: BorderRadius.circular(16.r),
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
                    'Suflet czekoladowy',
                    style: CustomTypography.uBold18,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '"Jakis opis fajnego dania, naprawde."',
                    style: CustomTypography.uRegular14n40,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    '40 MIN',
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
