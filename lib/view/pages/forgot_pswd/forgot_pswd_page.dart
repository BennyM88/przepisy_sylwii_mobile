import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_button.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_text_field.dart';

class ForgotPswdPage extends StatefulWidget {
  const ForgotPswdPage({super.key});

  @override
  State<ForgotPswdPage> createState() => _ForgotPswdPageState();
}

class _ForgotPswdPageState extends State<ForgotPswdPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 48.h),
                const _TopBar(),
                SizedBox(height: 0.2.sh),
                Text(
                  'Zapomniałeś hasła?\nWpisz swój email, a my wyślemy link z możliwością zresetowania go!',
                  style: CustomTypography.uRegular16,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 48.h),
                CustomTextField(
                  textEditingController: emailController,
                  hintText: 'Email',
                ),
                SizedBox(height: 48.h),
                CustomButton(content: 'Wyślij', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Icon(
        Icons.arrow_back_ios_new,
        size: 26.sp,
      ),
    );
  }
}
