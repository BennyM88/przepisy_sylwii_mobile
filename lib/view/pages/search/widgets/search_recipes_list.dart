import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/search_cubit/search_cubit.dart';
import 'package:przepisy_sylwii_mobile/view/pages/search/widgets/search_list_shimmer.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/recipe_item.dart';

class SearchRecipesList extends StatelessWidget {
  const SearchRecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (_, state) {
          if (state.isLoading) return const SearchListShimmer();
          if (state.errorMessage != null) {
            return Text(
              state.errorMessage!,
              style: CustomTypography.uRegular12red,
            );
          }
          return ListView.builder(
            itemCount: state.searchedRecipes.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (_, index) =>
                RecipeItem(recipe: state.searchedRecipes[index]),
          );
        },
      ),
    );
  }
}
