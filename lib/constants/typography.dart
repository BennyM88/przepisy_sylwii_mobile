import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';

class CustomTypography {
  // Font families:
  static const String ubuntuFontRegular = 'UbuntuRegular';
  static const String ubuntuFontBold = 'UbuntuBold';

  // Font weights:
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight regular = FontWeight.w400;

  static TextStyle uRegular18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: regular,
    fontFamily: ubuntuFontRegular,
    color: CustomColors.neutral00,
  );

  static TextStyle uBold22 = TextStyle(
    fontSize: 22.sp,
    fontWeight: bold,
    fontFamily: ubuntuFontBold,
    color: CustomColors.neutral00,
  );

  static TextStyle uBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: bold,
    fontFamily: ubuntuFontBold,
    color: CustomColors.neutral00,
  );

  static TextStyle uBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: bold,
    fontFamily: ubuntuFontBold,
    color: CustomColors.neutral00,
  );

  static TextStyle uRegular22 = TextStyle(
    fontSize: 22.sp,
    fontWeight: regular,
    fontFamily: ubuntuFontRegular,
    color: CustomColors.neutral00,
  );

  static TextStyle uRegular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: regular,
    fontFamily: ubuntuFontRegular,
    color: CustomColors.neutral00,
  );

  static TextStyle uRegular14n40 = TextStyle(
    fontSize: 14.sp,
    fontWeight: regular,
    fontFamily: ubuntuFontRegular,
    color: CustomColors.neutral40,
  );

  static TextStyle uRegular12n40 = TextStyle(
    fontSize: 12.sp,
    fontWeight: regular,
    fontFamily: ubuntuFontRegular,
    color: CustomColors.neutral40,
  );
}
