import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/fav_recipes_grid.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 48.h),
              const _TopBar(),
              SizedBox(height: 48.h),
              const FavRecipesGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
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
        Text('Ulubione dania', style: CustomTypography.uRegular18),
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
}
