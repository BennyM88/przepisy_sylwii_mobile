import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/forgot_pswd_cubit/forgot_pswd_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_button.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_text_field.dart';

class ForgotPswdPage extends StatelessWidget {
  const ForgotPswdPage({super.key});

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
                BlocBuilder<ForgotPswdCubit, ForgotPswdState>(
                  builder: (_, state) => state.maybeWhen(
                    success: () => const _SentEmail(),
                    orElse: () => const _MainView(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

class _MainView extends StatefulWidget {
  const _MainView();

  @override
  State<_MainView> createState() => __MainViewState();
}

class __MainViewState extends State<_MainView> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPswdCubit, ForgotPswdState>(
      builder: (_, state) {
        return Column(
          children: [
            Text(
              'Zapomniałeś hasła?\nWpisz swój email, a my wyślemy link z możliwością zresetowania go!',
              style: CustomTypography.uRegular16,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.h),
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
            SizedBox(height: 24.h),
            state.maybeWhen(
              error: () => Text(
                'Coś poszło nie tak',
                style: CustomTypography.uRegular12red,
              ),
              orElse: () => const SizedBox(),
            ),
            SizedBox(height: 24.h),
            state.maybeWhen(
              loading: () => CustomButton.loader(),
              orElse: () => CustomButton(
                content: 'Wyślij',
                onPressed: () async => getIt<ForgotPswdCubit>()
                    .sendResetPassword(emailController.text.trim()),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}

class _SentEmail extends StatelessWidget {
  const _SentEmail();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Email wysłany!\nSprawdź swoją skrzynkę, jeśli nie widzisz maila to zajrzyj do spamu.',
          style: CustomTypography.uRegular16,
          textAlign: TextAlign.center,
        ),
        Lottie.asset(
          'assets/lottie/email_sent.json',
        ),
      ],
    );
  }
}
