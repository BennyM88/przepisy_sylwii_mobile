import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogRectangleBorder {
  static ShapeBorder shapeBorderDialog = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(36.r),
      topRight: Radius.circular(36.r),
    ),
  );
}
