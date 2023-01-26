import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:przepisy_sylwii_mobile/constants/typography.dart';
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/models/user_profile.dart';
import 'package:przepisy_sylwii_mobile/view/widgets/user_details_row.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  UserProfile? userProfile;

  @override
  void initState() {
    super.initState();
    UserState userState = getIt<UserCubit>().state;
    if (userState is UserAuthenticated) {
      userProfile = userState.userProfile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 48.h),
              _topBar(context),
              SizedBox(height: 48.h),
              UserDetailsRow(
                title: 'Imie',
                content: userProfile?.firstName ?? '',
              ),
              UserDetailsRow(
                title: 'Email',
                content: userProfile?.email ?? '',
              ),
              UserDetailsRow(
                title: 'Data utworzenia',
                content: userProfile?.formatDate() ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 26.sp,
          ),
        ),
        Text('Twoje dane', style: CustomTypography.uRegular18),
        InkWell(
          onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
          child: Icon(
            Icons.clear,
            size: 28.sp,
          ),
        ),
      ],
    );
  }
}
