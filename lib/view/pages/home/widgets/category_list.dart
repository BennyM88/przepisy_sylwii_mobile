import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/category_list.dart';
import 'package:przepisy_sylwii_mobile/core/category_cubit/category_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/pages/home/widgets/category_box.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> category = [];
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
                onTap: () async {
                  if (category.contains(categoryList[index])) {
                    category.removeWhere(
                      (element) => element == categoryList[index],
                    );
                  } else {
                    category.add(categoryList[index]);
                  }
                  getIt<CategoryCubit>().setValues(category: category);
                },
                child: CategoryBox(
                  categoryName: categoryList[index],
                  state: state,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
