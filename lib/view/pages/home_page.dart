import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              _topBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar() {
    return Column(
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
    );
  }
}
