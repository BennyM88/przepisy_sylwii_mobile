import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';
import 'package:przepisy_sylwii_mobile/view/pages/home/home_page.dart';
import 'package:przepisy_sylwii_mobile/view/pages/login/login_page.dart';
import 'package:przepisy_sylwii_mobile/view/pages/test.dart';

class StateWrapper extends StatefulWidget {
  const StateWrapper({super.key});

  @override
  State<StateWrapper> createState() => _StateWrapperState();
}

class _StateWrapperState extends State<StateWrapper> {
  @override
  void initState() {
    super.initState();
    getIt<UserCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listenWhen: (previous, _) => previous is! UserAuthenticated,
      listener: (_, __) async {
        getIt<UserCubit>().fillUserWithData();
        getIt<RecipeCubit>().loadRecipes([]);
      },
      builder: (_, state) {
        if (state is UserAuthenticated) return const HomePage();
        if (state is UserUnauthenticated) return const LoginPage();
        return const TestPage();
      },
    );
  }
}
