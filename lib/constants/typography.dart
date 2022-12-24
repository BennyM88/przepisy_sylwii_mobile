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
}
