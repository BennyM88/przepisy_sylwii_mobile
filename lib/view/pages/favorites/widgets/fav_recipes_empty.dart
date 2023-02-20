import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';

class FavRecipesEmpty extends StatelessWidget {
  const FavRecipesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 48.h),
        Text(
          'Nie dodałeś jeszcze żadnego przepisu do ulubionych!',
          style: CustomTypography.uRegular16,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        Image.asset('assets/images/recipe.jpg'),
        SizedBox(height: 16.h),
        Text(
          'Znajdź swoje ulubione przepisy!',
          style: CustomTypography.uBold16,
        ),
      ],
    );
  }
}
