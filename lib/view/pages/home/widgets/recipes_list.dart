import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart';
import 'package:przepisy_sylwii_mobile/view/pages/home/widgets/recipe_box.dart';
import 'package:przepisy_sylwii_mobile/view/pages/home/widgets/recipes_list_shimmer.dart';
import 'package:przepisy_sylwii_mobile/view/pages/recipe_details/recipe_details_page.dart';

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
            if (state.errorMessage != null) {
              return Text(
                state.errorMessage!,
                style: CustomTypography.uRegular12red,
              );
            }
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
                child: RecipeBox(recipe: state.allRecipes[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
