// ignore_for_file: discarded_futures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:przepisy_sylwii_mobile/constants/colors.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/constants/url.dart';
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/dialogs/delete_acc_dialog.dart';
import 'package:przepisy_sylwii_mobile/view/pages/favorites/favorites_page.dart';
import 'package:przepisy_sylwii_mobile/view/pages/user_details/user_details_page.dart';
import 'package:przepisy_sylwii_mobile/view/utils/launch_url.dart';
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
              _settingsAccountBox(context),
              SizedBox(height: 36.h),
              Text('Informacje', style: CustomTypography.uRegular18),
              SizedBox(height: 12.h),
              _settingsInfoBox(),
              const Spacer(),
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (_, snapshot) {
                  PackageInfo? data = snapshot.data;
                  if (data == null) return const SizedBox();
                  return Center(
                    child: Text(
                      'Aktualna wersja: ${data.version}',
                      style: CustomTypography.uRegular14n40,
                    ),
                  );
                },
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

  Widget _settingsAccountBox(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: CustomColors.neutral99,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Column(
        children: [
          SettingsRow(
            onTap: () async => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserDetailsPage(),
              ),
            ),
            content: 'Twoje dane',
            icon: Icons.person_outline,
          ),
          SettingsRow(
            onTap: () async => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoritesPage(),
              ),
            ),
            content: 'Ulubione dania',
            icon: Icons.favorite_outline,
          ),
          SettingsRow(
            onTap: () async => showModalBottomSheet(
              context: context,
              builder: (_) => const DeleteAccDialog(),
            ),
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
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: Column(
        children: [
          SettingsRow(
            onTap: () async => openPrivacyOrTerms(PRIVACY),
            content: 'Polityka prywatności',
            icon: Icons.visibility_off_outlined,
          ),
          SettingsRow(
            onTap: () async => openPrivacyOrTerms(TERMS),
            content: 'Warunki użytkowania',
            icon: Icons.article_outlined,
          ),
          SettingsRow(
            onTap: () async => openMail(),
            content: 'Kontakt',
            icon: Icons.mail_outline,
          ),
        ],
      ),
    );
  }
}
