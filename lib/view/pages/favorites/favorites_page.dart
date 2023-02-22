import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/view/pages/favorites/widgets/fav_recipes_list.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/top_bar.dart';

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
              const TopBar(content: 'Ulubione dania', isDoubleClose: true),
              SizedBox(height: 32.h),
              const FavRecipesList(),
            ],
          ),
        ),
      ),
    );
  }
}
