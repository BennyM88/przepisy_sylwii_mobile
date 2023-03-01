import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/core/search_cubit/search_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/pages/search/widgets/search_recipes_list.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_text_field.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/top_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 48.h),
              const TopBar(content: 'Wyszukiwarka'),
              SizedBox(height: 48.h),
              CustomTextField(
                textEditingController: searchController,
                hintText: 'Szukaj...',
                suffixIcon: Icon(CupertinoIcons.search, size: 24.sp),
                onChanged: (keyword) {
                  if (_timer?.isActive ?? false) _timer?.cancel();
                  _timer = Timer(const Duration(milliseconds: 500), () async {
                    if (!mounted) return;
                    getIt<SearchCubit>().searchRecipe(keyword);
                  });
                },
              ),
              SizedBox(height: 12.h),
              const SearchRecipesList(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
