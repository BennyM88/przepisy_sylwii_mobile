import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/favorites_cubit/favorites_cubit.dart';
import 'package:przepisy_sylwii_mobile/view/dialogs/delete_fav_recipe_dialog.dart';
import 'package:przepisy_sylwii_mobile/view/pages/favorites/widgets/fav_recipes_empty.dart';
import 'package:przepisy_sylwii_mobile/view/pages/recipe_details/recipe_details_page.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/cached_image.dart';

class FavRecipesList extends StatelessWidget {
  const FavRecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (_, state) {
          return state.favoritesRecipes.isEmpty
              ? const FavRecipesEmpty()
              : ListView.builder(
                  itemCount: state.favoritesRecipes.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (_, index) =>
                      _FavRecipeItem(index: index, state: state),
                );
        },
      ),
    );
  }
}

class _FavRecipeItem extends StatelessWidget {
  final int index;
  final FavoritesState state;

  const _FavRecipeItem({required this.index, required this.state});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async => showModalBottomSheet(
        context: context,
        builder: (_) => DeleteFavRecipeDialog(
          recipe: state.favoritesRecipes[index],
        ),
      ),
      onTap: () async => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RecipeDetailsPage(
            recipe: state.favoritesRecipes[index],
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: SizedBox(
          height: 260.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: CachedImage(
                  url: state.favoritesRecipes[index].url,
                  height: 240,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        state.favoritesRecipes[index].dishName,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTypography.uRegular16,
                      ),
                    ),
                    Text(
                      '${state.favoritesRecipes[index].time} min',
                      style: CustomTypography.uRegular14n70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
