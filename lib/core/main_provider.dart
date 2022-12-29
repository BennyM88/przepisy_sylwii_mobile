import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';

class MainProvider extends StatelessWidget {
  final Widget child;

  const MainProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<RecipeCubit>()),
      ],
      child: child,
    );
  }
}
