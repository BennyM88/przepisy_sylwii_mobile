import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:przepisy_sylwii_mobile/core/add_ingredients_cubit/add_ingredients_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/add_new_recipe_cubit/add_new_recipe_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/add_photo_cubit/add_photo_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/add_preparation_cubit/add_preparation_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/amount_cubit/amount_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/category_cubit/category_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/favorites_cubit/favorites_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/login_cubit/login_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/register_cubit/register_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/search_cubit/search_cubit.dart';
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart';
import 'package:przepisy_sylwii_mobile/injection.dart';

class MainProvider extends StatelessWidget {
  final Widget child;

  const MainProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<RecipeCubit>()),
        BlocProvider(create: (_) => getIt<CategoryCubit>()),
        BlocProvider(create: (_) => getIt<LoginCubit>()),
        BlocProvider(create: (_) => getIt<RegisterCubit>()),
        BlocProvider(create: (_) => getIt<UserCubit>()),
        BlocProvider(create: (_) => getIt<FavoritesCubit>()),
        BlocProvider(create: (_) => getIt<AddPhotoCubit>()),
        BlocProvider(create: (_) => getIt<AmountCubit>()),
        BlocProvider(create: (_) => getIt<AddIngredientsCubit>()),
        BlocProvider(create: (_) => getIt<AddPreparationCubit>()),
        BlocProvider(create: (_) => getIt<AddNewRecipeCubit>()),
        BlocProvider(create: (_) => getIt<SearchCubit>()),
      ],
      child: child,
    );
  }
}
