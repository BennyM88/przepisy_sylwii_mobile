import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/favorites_cubit/favorites_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/view/pages/recipe_details/recipe_details_preparation_page.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/ingredients_row.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/shimmer_box.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailsPreparationPage(recipe: recipe),
          ),
        ),
        label: Row(
          children: [
            Text(
              'Zacznij gotować',
              style: CustomTypography.uRegular16n100,
            ),
            SizedBox(width: 6.w),
            Icon(
              Icons.arrow_forward_rounded,
              color: CustomColors.neutral100,
              size: 20.sp,
            ),
          ],
        ),
        backgroundColor: CustomColors.neutral00,
      ),
      body: SlidingUpPanel(
        minHeight: 0.6.sh,
        maxHeight: 0.75.sh,
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.r),
          topRight: Radius.circular(36.r),
        ),
        body: _Body(recipe),
        panel: _Panel(recipe),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Recipe recipe;

  const _Body(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: recipe.url,
          fit: BoxFit.cover,
          height: 380.h,
          filterQuality: FilterQuality.high,
          placeholder: (_, __) =>
              const ShimmerBox(height: 380, width: double.infinity, radius: 0),
          errorWidget: (_, __, ___) => const Icon(Icons.error),
        ),
        Positioned(
          top: 70.h,
          left: 20.w,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: CustomColors.neutral100,
              size: 28.sp,
            ),
          ),
        ),
        Positioned(
          top: 70.h,
          right: 25.w,
          child: InkWell(
            onTap: () async =>
                getIt<FavoritesCubit>().addOrRemoveFavorites(recipe),
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (_, state) => Icon(
                state.favoritesRecipes.contains(recipe)
                    ? Icons.favorite
                    : Icons.favorite_outline,
                color: CustomColors.neutral100,
                size: 30.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Panel extends StatelessWidget {
  final Recipe recipe;

  const _Panel(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipe.dishName,
            style: CustomTypography.uBold28,
          ),
          SizedBox(height: 6.h),
          _PanelInfo(recipe),
          SizedBox(height: 6.h),
          const Divider(thickness: 1),
          SizedBox(height: 12.h),
          Text(
            'Składniki',
            style: CustomTypography.uRegular22,
          ),
          SizedBox(
            height: 0.45.sh,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 12.h),
              physics: const ClampingScrollPhysics(),
              itemCount: recipe.ingredients.length,
              itemBuilder: (_, index) =>
                  IngredientsRow(index: index, recipe: recipe),
            ),
          ),
        ],
      ),
    );
  }
}

class _PanelInfo extends StatelessWidget {
  final Recipe recipe;

  const _PanelInfo(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(
              Icons.timer_outlined,
              color: CustomColors.neutral40,
              size: 16.sp,
            ),
            SizedBox(width: 3.w),
            Text(
              '${recipe.time} min',
              style: CustomTypography.uRegular14n40,
            ),
          ],
        ),
        SizedBox(width: 6.w),
        Container(
          color: CustomColors.neutral40,
          height: 10.h,
          width: 1.w,
        ),
        SizedBox(width: 6.w),
        Row(
          children: [
            Icon(
              Icons.people_alt_outlined,
              color: CustomColors.neutral40,
              size: 16.sp,
            ),
            SizedBox(width: 3.w),
            Text(
              _getAmount(recipe.amount),
              style: CustomTypography.uRegular14n40,
            ),
          ],
        ),
      ],
    );
  }

  String _getAmount(int amount) {
    String result = '';
    if (amount == 1) {
      result = 'porcja';
    } else if (amount > 1 && amount < 5) {
      result = 'porcje';
    } else {
      result = 'porcji';
    }
    return '$amount $result';
  }
}
