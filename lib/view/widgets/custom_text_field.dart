import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool isPassword;
  final bool isEnabled;
  final int? fieldMaxLength;

  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.isPassword = false,
    this.isEnabled = true,
    this.fieldMaxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      style: CustomTypography.uRegular14,
      controller: textEditingController,
      maxLength: fieldMaxLength,
      obscureText: isPassword ? true : false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          borderSide: const BorderSide(color: CustomColors.neutral70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          borderSide: const BorderSide(color: CustomColors.neutral90),
        ),
        labelText: hintText,
        labelStyle: CustomTypography.uRegular14,
        hintText: hintText,
        hintStyle: CustomTypography.uRegular14n70,
      ),
    );
  }
}
