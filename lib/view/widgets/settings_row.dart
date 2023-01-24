import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';

class SettingsRow extends StatelessWidget {
  final void Function() onTap;
  final String content;
  final IconData icon;

  const SettingsRow({
    required this.onTap,
    required this.content,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22.sp,
            ),
            SizedBox(width: 16.w),
            Text(
              content,
              style: CustomTypography.uRegular14,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14.sp,
            )
          ],
        ),
      ),
    );
  }
}
