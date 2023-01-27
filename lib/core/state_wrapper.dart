import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart';
import 'package:przepisy_sylwii_mobile/view/pages/home/home_page.dart';
import 'package:przepisy_sylwii_mobile/view/pages/login/login_page.dart';
import 'package:przepisy_sylwii_mobile/view/pages/test.dart';

class StateWrapper extends StatelessWidget {
  const StateWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (_, state) {
        if (state is UserAuthenticated) return const HomePage();
        if (state is UserUnauthenticated) return const LoginPage();
        return const TestPage();
      },
    );
  }
}
