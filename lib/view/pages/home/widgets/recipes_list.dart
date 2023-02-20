import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/view/pages/home/widgets/recipes_list_shimmer.dart';
import 'package:przepisy_sylwii_mobile/view/pages/recipe_details/recipe_details_page.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/shimmer_box.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: SizedBox(
        height: 390.h,
        child: BlocBuilder<RecipeCubit, RecipeState>(
          builder: (_, state) {
            if (state.isLoading) return const RecipesListShimmer();
            if (state.errorMessage != null) return Text(state.errorMessage!);
            return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.allRecipes.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        RecipeDetailsPage(recipe: state.allRecipes[index]),
                  ),
                ),
                child: _buildRecipeBox(state.allRecipes[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRecipeBox(Recipe recipe) {
    return Padding(
      padding: EdgeInsets.only(right: 40.w),
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
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              child: CachedNetworkImage(
                imageUrl: recipe.url,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                placeholder: (_, __) =>
                    const ShimmerBox(height: 280, width: 280, radius: 16),
                errorWidget: (_, __, ___) => const Icon(Icons.error),
              ),
            ),
          ),
          Positioned(
            left: 20.w,
            bottom: 25.h,
            child: Container(
              width: 240.w,
              padding: EdgeInsets.all(16.h),
              decoration: BoxDecoration(
                color: CustomColors.pink,
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
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
                    recipe.dishName,
                    style: CustomTypography.uBold18,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '"${recipe.desc}"',
                    style: CustomTypography.uRegular14n40w,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    '${recipe.time} min',
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
