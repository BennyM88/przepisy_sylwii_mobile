import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/add_ingredients_cubit/add_ingredients_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/add_new_recipe_cubit/add_new_recipe_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/add_photo_cubit/add_photo_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/add_preparation_cubit/add_preparation_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/amount_cubit/amount_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/pages/create_recipe/widgets/add_ingredients_section.dart';
import 'package:przepisy_sylwii_mobile/view/pages/create_recipe/widgets/add_photo_section.dart';
import 'package:przepisy_sylwii_mobile/view/pages/create_recipe/widgets/add_preparation_section.dart';
import 'package:przepisy_sylwii_mobile/view/pages/create_recipe/widgets/amount_section.dart';
import 'package:przepisy_sylwii_mobile/view/pages/create_recipe/widgets/create_recipe_text_field_section.dart';
import 'package:przepisy_sylwii_mobile/view/pages/create_recipe/widgets/pick_category_section.dart';
import 'package:przepisy_sylwii_mobile/view/utils/snackbar.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_button.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/top_bar.dart';

class CreateRecipePage extends StatefulWidget {
  const CreateRecipePage({super.key});

  @override
  State<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  String categoryValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 48.h),
                const TopBar(content: 'Stwórz przepis'),
                SizedBox(height: 48.h),
                const AddPhotoSection(),
                CreateRecipeTextFieldSection(
                  textEditingController: titleController,
                  title: 'Nazwa przepisu',
                ),
                CreateRecipeTextFieldSection(
                  textEditingController: descController,
                  title: 'Opis przepisu',
                ),
                CreateRecipeTextFieldSection(
                  textEditingController: timeController,
                  title: 'Czas',
                  isNumeric: true,
                  suffixText: 'min',
                ),
                SizedBox(height: 24.h),
                Text(
                  'Dla ilu osób',
                  style: CustomTypography.uRegular18,
                ),
                SizedBox(height: 12.h),
                const AmountSection(),
                SizedBox(height: 24.h),
                Text(
                  'Kategoria',
                  style: CustomTypography.uRegular18,
                ),
                SizedBox(height: 12.h),
                PickCategorySection(
                  categoryCallback: (newValue) {
                    if (mounted) {
                      setState(() {
                        categoryValue = newValue;
                      });
                    }
                  },
                ),
                const AddIngredientsSection(),
                const AddPreparationSection(),
                SizedBox(height: 24.h),
                BlocConsumer<AddNewRecipeCubit, AddNewRecipeState>(
                  listener: (_, state) => state.whenOrNull(
                    error: (errorMessage) async =>
                        displaySnackBar(errorMessage!),
                    success: () async {
                      displaySnackBar('Dodano nowy przepis');
                      clearFields();
                      return null;
                    },
                  ),
                  builder: (_, state) => state.maybeWhen(
                    loading: () => CustomButton.loaderPink(),
                    orElse: () => CustomButton(
                      content: 'Dodaj',
                      onPressed: () async =>
                          getIt<AddNewRecipeCubit>().addNewRecipe(
                        getIt<AddPhotoCubit>().getUrl(),
                        titleController.text.trim(),
                        descController.text.trim(),
                        timeController.text.trim(),
                        getIt<AmountCubit>().state,
                        categoryValue,
                        getIt<AddIngredientsCubit>().state.ingredients,
                        getIt<AddPreparationCubit>().state.preparation,
                      ),
                      isPink: true,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearFields() {
    getIt<AddPhotoCubit>().deletePhoto();
    titleController.clear();
    descController.clear();
    timeController.clear();
    getIt<AmountCubit>().clear();
    getIt<AddIngredientsCubit>().clear();
    getIt<AddPreparationCubit>().clear();
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    timeController.dispose();
    super.dispose();
  }
}
