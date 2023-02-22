import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/view/pages/create_recipe/widgets/add_photo_section.dart';
import 'package:przepisy_sylwii_mobile/view/pages/create_recipe/widgets/amount_section.dart';
import 'package:przepisy_sylwii_mobile/view/pages/create_recipe/widgets/create_recipe_text_field_section.dart';
import 'package:przepisy_sylwii_mobile/view/pages/create_recipe/widgets/pick_category_section.dart';
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
                SizedBox(height: 48.h),
                CustomButton(content: 'Dodaj', onPressed: () {}, isPink: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    timeController.dispose();
    super.dispose();
  }
}
