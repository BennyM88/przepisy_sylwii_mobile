import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_button.dart';

class DeleteAccDialog extends StatelessWidget {
  const DeleteAccDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Czy na pewno chcesz usunąć swoje konto?',
            style: CustomTypography.uRegular16,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          CustomButton(
            content: 'Tak',
            onPressed: () {},
            isPink: true,
          ),
          SizedBox(height: 12.h),
          CustomButton(
            content: 'Nie',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
