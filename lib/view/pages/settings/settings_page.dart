import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';

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
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 26.sp,
                ),
              ),
              InkWell(
                onTap: () async {
                  getIt<UserCubit>().logout();
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
