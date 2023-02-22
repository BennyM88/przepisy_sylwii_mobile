import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/add_ingredients_cubit/add_ingredients_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/pages/create_recipe/widgets/create_recipe_text_field_section.dart';

class AddIngredientsSection extends StatefulWidget {
  const AddIngredientsSection({super.key});

  @override
  State<AddIngredientsSection> createState() => _AddIngredientsSectionState();
}

class _AddIngredientsSectionState extends State<AddIngredientsSection> {
  final TextEditingController ingredientsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CreateRecipeTextFieldSection(
          textEditingController: ingredientsController,
          title: 'Składniki',
          suffixIcon: IconButton(
            onPressed: () {
              getIt<AddIngredientsCubit>()
                  .addIngredient(ingredientsController.text.trim());
              ingredientsController.clear();
            },
            icon: Icon(Icons.add, size: 24.sp),
          ),
        ),
        SizedBox(height: 12.h),
        BlocBuilder<AddIngredientsCubit, AddIngredientsState>(
          builder: (_, state) {
            return ListView.builder(
              itemCount: state.ingredients.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Container(
                    padding: EdgeInsets.only(left: 12.w),
                    decoration: BoxDecoration(
                      color: CustomColors.neutral95,
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            state.ingredients[index],
                            style: CustomTypography.uRegular14,
                          ),
                        ),
                        IconButton(
                          onPressed: () => getIt<AddIngredientsCubit>()
                              .removeIngredient(index),
                          style: const ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                          ),
                          icon: Icon(Icons.clear, size: 18.sp),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    ingredientsController.dispose();
    super.dispose();
  }
}
