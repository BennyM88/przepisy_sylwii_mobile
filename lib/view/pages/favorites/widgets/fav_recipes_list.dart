import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przepisy_sylwii_mobile/core/favorites_cubit/favorites_cubit.dart';
import 'package:przepisy_sylwii_mobile/view/pages/favorites/widgets/fav_recipes_empty.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/recipe_item.dart';

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
                  itemBuilder: (_, index) => RecipeItem(
                    recipe: state.favoritesRecipes[index],
                    isLongPress: true,
                  ),
                );
        },
      ),
    );
  }
}
