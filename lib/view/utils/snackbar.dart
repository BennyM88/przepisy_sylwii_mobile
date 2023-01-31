import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/main.dart';

Future<void> displaySnackBar(String content) async {
  scaffoldKey.currentState
      ?.showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
              color: CustomColors.neutral40,
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
            ),
            child: Text(content),
          ),
        ),
      )
      .closed
      .then((_) => scaffoldKey.currentState?.clearSnackBars());
}
