import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final bool isStack;

  const ShimmerBox({
    super.key,
    required this.height,
    required this.width,
    required this.radius,
    this.isStack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CustomColors.neutral90,
      highlightColor: CustomColors.neutral95,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          borderRadius: isStack
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(radius.r),
                  bottomRight: Radius.circular(radius.r),
                )
              : BorderRadius.all(Radius.circular(radius.r)),
          color: CustomColors.neutral100,
        ),
      ),
    );
  }
}
