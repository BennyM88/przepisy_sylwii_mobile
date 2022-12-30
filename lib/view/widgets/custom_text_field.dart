import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final bool isPassword;
  final int? fieldMaxLength;

  const CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.isPassword = false,
    this.fieldMaxLength,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: true,
      style: CustomTypography.uRegular14,
      controller: widget.textEditingController,
      maxLength: widget.fieldMaxLength,
      obscureText: widget.isPassword ? true : false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: CustomColors.neutral70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        labelText: widget.hintText,
        labelStyle: CustomTypography.uRegular14,
        hintText: widget.hintText,
        hintStyle: CustomTypography.uRegular14n70,
      ),
    );
  }
}
