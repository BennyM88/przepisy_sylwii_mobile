import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/favorites_cubit/favorites_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_button.dart';

class DeleteFavRecipeDialog extends StatelessWidget {
  final Recipe recipe;

  const DeleteFavRecipeDialog({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Czy na pewno chcesz usunąć ten przepis z ulubionych?',
            style: CustomTypography.uRegular16,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          CustomButton(
            content: 'Tak',
            onPressed: () async {
              getIt<FavoritesCubit>().addOrRemoveFavorites(recipe);
              Navigator.pop(context);
            },
            isPink: true,
          ),
          SizedBox(height: 12.h),
          CustomButton(
            content: 'Nie',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
