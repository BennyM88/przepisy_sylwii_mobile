import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/view/dialogs/delete_fav_recipe_dialog.dart';
import 'package:przepisy_sylwii_mobile/view/pages/recipe_details/recipe_details_page.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/cached_image.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;
  final bool isLongPress;

  const RecipeItem({super.key, required this.recipe, this.isLongPress = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async => isLongPress
          ? showModalBottomSheet(
              context: context,
              builder: (_) => DeleteFavRecipeDialog(
                recipe: recipe,
              ),
            )
          : null,
      onTap: () async => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => RecipeDetailsPage(
            recipe: recipe,
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
                  url: recipe.url,
                  height: 200,
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
                        recipe.dishName,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTypography.uRegular16,
                      ),
                    ),
                    Text(
                      '${recipe.time} min',
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
