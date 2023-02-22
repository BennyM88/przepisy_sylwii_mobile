import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';

class CreateRecipeTextFieldSection extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String? suffixText;
  final bool isNumeric;

  const CreateRecipeTextFieldSection({
    Key? key,
    required this.textEditingController,
    required this.title,
    this.suffixText,
    this.isNumeric = false,
  }) : super(key: key);

  @override
  State<CreateRecipeTextFieldSection> createState() =>
      _CreateRecipeTextFieldSectionState();
}

class _CreateRecipeTextFieldSectionState
    extends State<CreateRecipeTextFieldSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        Text(
          widget.title,
          style: CustomTypography.uRegular18,
        ),
        SizedBox(height: 12.h),
        TextField(
          controller: widget.textEditingController,
          style: CustomTypography.uRegular14,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          keyboardType:
              widget.isNumeric ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: CustomColors.neutral95,
            isDense: true,
            suffixText: widget.suffixText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
