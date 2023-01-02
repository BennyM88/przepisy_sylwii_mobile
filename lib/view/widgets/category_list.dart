import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/category_list.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/category_cubit/category_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<String> _category = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: SizedBox(
        height: 36.h,
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (_, state) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  String selectedCategory = categoryList[index];
                  if (_category.contains(categoryList[index])) {
                    _category
                        .removeWhere((element) => element == selectedCategory);
                  } else {
                    _category.add(categoryList[index]);
                  }
                  getIt<CategoryCubit>().setValues(category: _category);
                },
                child: _buildCategoryBox(categoryList[index], state),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryBox(String categoryName, CategoryState state) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Container(
        decoration: BoxDecoration(
          color: state.category.contains(categoryName)
              ? CustomColors.neutral00
              : CustomColors.neutral95.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Center(
            child: Text(
              categoryName,
              style: state.category.contains(categoryName)
                  ? CustomTypography.uRegular14white
                  : CustomTypography.uRegular14,
            ),
          ),
        ),
      ),
    );
  }
}
