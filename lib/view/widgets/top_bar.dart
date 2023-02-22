import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';

class TopBar extends StatelessWidget {
  final String content;
  final bool isDoubleClose;

  const TopBar({super.key, required this.content, this.isDoubleClose = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 26.sp,
          ),
        ),
        const Spacer(),
        Text(
          content,
          style: isDoubleClose
              ? CustomTypography.uRegular18
              : CustomTypography.uRegular22,
        ),
        const Spacer(),
        isDoubleClose
            ? InkWell(
                onTap: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst),
                child: Icon(
                  Icons.clear,
                  size: 28.sp,
                ),
              )
            : SizedBox(width: 26.sp),
      ],
    );
  }
}
