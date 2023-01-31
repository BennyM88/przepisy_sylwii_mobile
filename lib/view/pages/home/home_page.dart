import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart';
import 'package:przepisy_sylwii_mobile/view/pages/settings/settings_page.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/category_list.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/recipes_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 28.h),
            const _TopBar(),
            SizedBox(height: 42.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                'Wybierz kategorie',
                style: CustomTypography.uRegular22,
              ),
            ),
            SizedBox(height: 16.h),
            const CategoryList(),
            SizedBox(height: 16.h),
            const RecipesList(),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cześć,',
            style: CustomTypography.uRegular18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<UserCubit, UserState>(
                builder: (_, state) {
                  return Text(
                    state is UserAuthenticated
                        ? state.userProfile?.firstName ?? ''
                        : 'Unknown',
                    style: CustomTypography.uBold22,
                  );
                },
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Icon(
                  CupertinoIcons.search,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 28.w),
              InkWell(
                onTap: () async => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                ),
                child: Icon(
                  Icons.notes,
                  size: 24.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
