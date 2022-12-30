import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_button.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 100.h),
              Container(
                height: 100.h,
                width: double.infinity,
                color: Colors.red,
              ),
              SizedBox(height: 48.h),
              _googleButton(onTap: () {}),
              SizedBox(height: 24.h),
              _divider(),
              SizedBox(height: 24.h),
              CustomTextField(
                textEditingController: emailController,
                hintText: 'Email',
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                textEditingController: passwordController,
                hintText: 'Hasło',
                isPassword: true,
              ),
              SizedBox(height: 24.h),
              CustomButton(content: 'Zaloguj', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  Widget _googleButton({
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Kontynuuj z Google', style: CustomTypography.uRegular18),
            SizedBox(width: 10.w),
            Image.asset('assets/images/google.png', width: 18.w),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              height: 2,
              thickness: 1,
              color: CustomColors.neutral00,
            ),
          ),
          SizedBox(width: 7.w),
          Text(
            'lub',
            style: CustomTypography.uRegular14,
          ),
          SizedBox(width: 7.w),
          const Expanded(
            child: Divider(
              height: 2,
              thickness: 1,
              color: CustomColors.neutral00,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
