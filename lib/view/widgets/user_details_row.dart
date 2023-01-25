import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';

class UserDetailsRow extends StatelessWidget {
  final String title;
  final String content;

  const UserDetailsRow({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 36.h),
        Text(
          title,
          style: CustomTypography.uRegular14n70,
        ),
        SizedBox(height: 10.h),
        Text(
          content,
          style: CustomTypography.uRegular16,
        ),
        const Divider(
          color: CustomColors.neutral50,
        ),
      ],
    );
  }
}
