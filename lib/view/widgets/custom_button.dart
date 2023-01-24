import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';

class CustomButton extends StatelessWidget {
  final String content;
  final Widget? prefix;
  final Widget? suffix;
  final void Function()? onPressed;
  final bool isPink;

  // Special variant:
  factory CustomButton.loader() {
    return CustomButton(
      content: '',
      suffix: SizedBox(
        height: 18.sp,
        width: 18.sp,
        child: CircularProgressIndicator(
          color: CustomColors.neutral100,
          strokeWidth: 3.w,
        ),
      ),
      onPressed: null,
    );
  }

  const CustomButton({
    required this.content,
    this.prefix,
    this.suffix,
    required this.onPressed,
    this.isPink = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0.0),
        backgroundColor: MaterialStateProperty.all<Color>(
          isPink ? CustomColors.pink : CustomColors.neutral00,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
      ),
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(14.h),
        child: prefix == null && suffix == null
            ? Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    content,
                    style: isPink
                        ? CustomTypography.uRegular18
                        : CustomTypography.uRegular18white,
                    softWrap: false,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefix != null) ...[
                    prefix!,
                    SizedBox(width: 10.w),
                  ],
                  Text(
                    content,
                    style: CustomTypography.uRegular18white,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                  if (suffix != null) ...[
                    SizedBox(width: 10.w),
                    suffix!,
                  ],
                ],
              ),
      ),
    );
  }
}
