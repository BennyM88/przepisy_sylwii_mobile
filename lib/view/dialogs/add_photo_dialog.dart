import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/add_photo_cubit/add_photo_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';

class AddPhotoDialog extends StatelessWidget {
  const AddPhotoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Jak chcesz dodać zdjęcie?',
            style: CustomTypography.uRegular16,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              getIt<AddPhotoCubit>().uploadPhoto(ImageSource.camera);
            },
            child: Row(
              children: [
                Icon(Icons.photo_camera_outlined, size: 24.sp),
                SizedBox(width: 12.w),
                Text(
                  'Zrób zdjęcie',
                  style: CustomTypography.uRegular14,
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              getIt<AddPhotoCubit>().uploadPhoto(ImageSource.gallery);
            },
            child: Row(
              children: [
                Icon(Icons.photo_library_outlined, size: 24.sp),
                SizedBox(width: 12.w),
                Text(
                  'Dodaj zdjęcie z galerii',
                  style: CustomTypography.uRegular14,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
