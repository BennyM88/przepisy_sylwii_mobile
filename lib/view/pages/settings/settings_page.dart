import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/custom_button.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/settings_row.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 48.h),
              _topBar(context),
              SizedBox(height: 48.h),
              Text('Konto', style: CustomTypography.uRegular18),
              SizedBox(height: 12.h),
              _settingsAccountBox(),
              SizedBox(height: 36.h),
              Text('Informacje', style: CustomTypography.uRegular18),
              SizedBox(height: 12.h),
              _settingsInfoBox(),
              const Spacer(),
              Center(
                child: Text(
                  'Aktualna wersja: 1.0.0',
                  style: CustomTypography.uRegular14n40,
                ),
              ),
              SizedBox(height: 12.h),
              CustomButton(
                content: 'Wyloguj',
                isPink: true,
                onPressed: () async {
                  getIt<UserCubit>().logout();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
              SizedBox(height: 36.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 26.sp,
          ),
        ),
        const Spacer(),
        Text(
          'Ustawienia',
          style: CustomTypography.uRegular22,
        ),
        const Spacer(),
        SizedBox(width: 26.sp),
      ],
    );
  }

  Widget _settingsAccountBox() {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: CustomColors.neutral99,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          SettingsRow(
            onTap: () {},
            content: 'Twoje dane',
            icon: Icons.person_outline,
          ),
          SettingsRow(
            onTap: () {},
            content: 'Ulubione dania',
            icon: Icons.favorite_outline,
          ),
          SettingsRow(
            onTap: () {},
            content: 'Usuń konto',
            icon: Icons.delete_outlined,
          ),
        ],
      ),
    );
  }

  Widget _settingsInfoBox() {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: CustomColors.neutral99,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          SettingsRow(
            onTap: () {},
            content: 'Polityka prywatności',
            icon: Icons.visibility_off_outlined,
          ),
          SettingsRow(
            onTap: () {},
            content: 'Warunki użytkowania',
            icon: Icons.article_outlined,
          ),
          SettingsRow(
            onTap: () {},
            content: 'Kontakt',
            icon: Icons.mail_outline,
          ),
        ],
      ),
    );
  }
}
