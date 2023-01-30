import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_button.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_text_field.dart';

class ChangePswdDialog extends StatefulWidget {
  const ChangePswdDialog({super.key});

  @override
  State<ChangePswdDialog> createState() => _ChangePswdDialogState();
}

class _ChangePswdDialogState extends State<ChangePswdDialog> {
  final TextEditingController currentPswdController = TextEditingController();
  final TextEditingController newPswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Podaj aktualne hasło',
            style: CustomTypography.uRegular14,
          ),
          SizedBox(height: 8.h),
          CustomTextField(
            textEditingController: currentPswdController,
            hintText: 'aktualne',
          ),
          SizedBox(height: 24.h),
          Text(
            'Podaj nowe hasło',
            style: CustomTypography.uRegular14,
          ),
          SizedBox(height: 8.h),
          CustomTextField(
            textEditingController: newPswdController,
            hintText: 'nowe',
          ),
          SizedBox(height: 24.h),
          Center(
            child: Text(
              '',
              style: CustomTypography.uRegular12red,
            ),
          ),
          SizedBox(height: 24.h),
          CustomButton(
            content: 'Zmień',
            onPressed: () {},
            isPink: true,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    currentPswdController.dispose();
    newPswdController.dispose();
    super.dispose();
  }
}
