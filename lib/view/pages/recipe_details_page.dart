import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/models/recipe.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsPage({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(
          'Zacznij gotować',
          style: CustomTypography.uRegular16n100,
        ),
        backgroundColor: CustomColors.neutral00,
      ),
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
        Image.network(
          recipe.url,
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
          right: 25.w,
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
            recipe.dishName,
            style: CustomTypography.uBold22,
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Text(
                '${recipe.time} min',
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
                _getAmount(recipe.amount),
                style: CustomTypography.uRegular12n40,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getAmount(int amount) {
    String result = '';
    if (amount == 1) {
      result = 'porcja';
    } else if (amount > 1 && amount < 5) {
      result = 'porcje';
    } else {
      result = 'porcji';
    }
    return '$amount $result';
  }
}
