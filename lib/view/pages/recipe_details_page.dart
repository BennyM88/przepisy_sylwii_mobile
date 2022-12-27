import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 0.6.sh,
        maxHeight: 0.75.sh,
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36.r),
          topRight: Radius.circular(36.r),
        ),
        body: _body(context),
        panel: _panel(),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/suflet.jpg',
          height: 380.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 70.h,
          left: 20.w,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: CustomColors.neutral100,
              size: 26.sp,
            ),
          ),
        ),
        Positioned(
          top: 70.h,
          right: 20.w,
          child: InkWell(
            onTap: () {},
            child: Icon(
              Icons.favorite,
              color: CustomColors.neutral100,
              size: 26.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _panel() {
    return Padding(
      padding: EdgeInsets.all(32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Suflet czekoladowy',
            style: CustomTypography.uBold22,
          ),
          SizedBox(height: 6.h),
          Container(
            color: CustomColors.neutral00,
            height: 2.h,
            width: 110.w,
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Text(
                '40 min',
                style: CustomTypography.uRegular12n40,
              ),
              SizedBox(width: 6.h),
              Container(
                color: CustomColors.neutral40,
                height: 10.h,
                width: 1.w,
              ),
              SizedBox(width: 6.h),
              Text(
                '5 porcji',
                style: CustomTypography.uRegular12n40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
