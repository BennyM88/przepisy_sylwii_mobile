import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/login_cubit/login_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60.h),
                SizedBox(
                  height: 200.h,
                  child: Lottie.asset(
                    'assets/lottie/cooking.json',
                    repeat: false,
                  ),
                ),
                SizedBox(height: 48.h),
                _googleButton(
                  onTap: () async => getIt<LoginCubit>().signInWithGoogle(),
                ),
                SizedBox(height: 24.h),
                const _Divider(),
                SizedBox(height: 24.h),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (_, state) {
                    return Column(
                      children: [
                        state.maybeWhen(
                          loading: () => CustomTextField(
                            textEditingController: emailController,
                            hintText: 'Email',
                            isEnabled: false,
                          ),
                          orElse: () => CustomTextField(
                            textEditingController: emailController,
                            hintText: 'Email',
                          ),
                        ),
                        SizedBox(height: 16.h),
                        state.maybeWhen(
                          loading: () => CustomTextField(
                            textEditingController: passwordController,
                            hintText: 'Hasło',
                            isPassword: true,
                            isEnabled: false,
                          ),
                          orElse: () => CustomTextField(
                            textEditingController: passwordController,
                            hintText: 'Hasło',
                            isPassword: true,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        state.maybeWhen(
                          error: (e) => Text(
                            e.toString(),
                            style: CustomTypography.uRegular12red,
                          ),
                          orElse: () => const SizedBox(),
                        ),
                        SizedBox(height: 12.h),
                        state.maybeWhen(
                          loading: () => CustomButton.loader(),
                          orElse: () => CustomButton(
                            content: 'Zaloguj',
                            onPressed: () async => getIt<LoginCubit>().login(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nie masz konta? ',
                      style: CustomTypography.uRegular14,
                    ),
                    Text(
                      'Zarejestruj się!',
                      style: CustomTypography.uBold14,
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Zapomniałeś hasła?',
                    style: CustomTypography.uBold14,
                  ),
                ),
              ],
            ),
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
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
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
}
