import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            _topBar(),
            SizedBox(height: 50.h),
            Padding(
              padding: EdgeInsets.only(left: 24.w),
              child: Text(
                'Wybierz kategorie',
                style: CustomTypography.uRegular22,
              ),
            ),
            SizedBox(height: 16.h),
            CategoryList(),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cześć,',
                style: CustomTypography.uRegular18,
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
                onTap: () {},
                child: Icon(
                  Icons.notes,
                  size: 24.sp,
                ),
              ),
            ],
          ),
          Text(
            'Gal Anonim',
            style: CustomTypography.uBold22,
          ),
        ],
      ),
    );
  }
}
