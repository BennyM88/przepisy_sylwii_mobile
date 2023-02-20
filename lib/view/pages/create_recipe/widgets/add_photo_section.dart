import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';

class AddPhotoSection extends StatelessWidget {
  const AddPhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 200.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_camera_outlined,
              color: CustomColors.neutral40,
              size: 28.sp,
            ),
            SizedBox(height: 8.h),
            Text(
              'Dodaj zdjęcie',
              style: CustomTypography.uRegular14n40,
            ),
          ],
        ),
      ),
    );
  }
}
