import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';

class FavRecipesGrid extends StatelessWidget {
  const FavRecipesGrid({super.key});
  //TODO refactor/change design
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: getIt<RecipeCubit>().state.allRecipes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.6.sw / 0.4.sh,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(12.sp),
            child: Container(
              height: 700.h,
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.neutral80,
                    offset: const Offset(1, 1),
                    blurRadius: 5.r,
                    spreadRadius: 0.2.r,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Image.network(
                      getIt<RecipeCubit>().state.allRecipes[index].url,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    getIt<RecipeCubit>().state.allRecipes[index].dishName,
                    style: CustomTypography.uRegular14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
