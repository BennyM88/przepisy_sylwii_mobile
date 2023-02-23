// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:przepisy_sylwii_mobile/core/add_ingredients_cubit/add_ingredients_cubit.dart'
    as _i3;
import 'package:przepisy_sylwii_mobile/core/add_new_recipe_cubit/add_new_recipe_cubit.dart'
    as _i13;
import 'package:przepisy_sylwii_mobile/core/add_photo_cubit/add_photo_cubit.dart'
    as _i4;
import 'package:przepisy_sylwii_mobile/core/add_preparation_cubit/add_preparation_cubit.dart'
    as _i5;
import 'package:przepisy_sylwii_mobile/core/amount_cubit/amount_cubit.dart'
    as _i6;
import 'package:przepisy_sylwii_mobile/core/category_cubit/category_cubit.dart'
    as _i14;
import 'package:przepisy_sylwii_mobile/core/change_pswd_cubit/change_pswd_cubit.dart'
    as _i15;
import 'package:przepisy_sylwii_mobile/core/delete_acc_cubit/delete_acc_cubit.dart'
    as _i18;
import 'package:przepisy_sylwii_mobile/core/favorites_cubit/favorites_cubit.dart'
    as _i16;
import 'package:przepisy_sylwii_mobile/core/forgot_pswd_cubit/forgot_pswd_cubit.dart'
    as _i9;
import 'package:przepisy_sylwii_mobile/core/login_cubit/login_cubit.dart'
    as _i10;
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart'
    as _i11;
import 'package:przepisy_sylwii_mobile/core/register_cubit/register_cubit.dart'
    as _i12;
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart' as _i17;
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart'
    as _i7;
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart'
    as _i8;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AddIngredientsCubit>(_i3.AddIngredientsCubit());
    gh.singleton<_i4.AddPhotoCubit>(_i4.AddPhotoCubit());
    gh.singleton<_i5.AddPreparationCubit>(_i5.AddPreparationCubit());
    gh.singleton<_i6.AmountCubit>(_i6.AmountCubit());
    gh.factory<_i7.FirebaseAuthRepository>(() => _i7.FirebaseAuthRepository());
    gh.factory<_i8.FirebaseRepository>(() => _i8.FirebaseRepository());
    gh.singleton<_i9.ForgotPswdCubit>(
        _i9.ForgotPswdCubit(gh<_i7.FirebaseAuthRepository>()));
    gh.singleton<_i10.LoginCubit>(
        _i10.LoginCubit(gh<_i7.FirebaseAuthRepository>()));
    gh.singleton<_i11.RecipeCubit>(
        _i11.RecipeCubit(gh<_i8.FirebaseRepository>()));
    gh.singleton<_i12.RegisterCubit>(
        _i12.RegisterCubit(gh<_i7.FirebaseAuthRepository>()));
    gh.singleton<_i13.AddNewRecipeCubit>(
        _i13.AddNewRecipeCubit(gh<_i8.FirebaseRepository>()));
    gh.singleton<_i14.CategoryCubit>(
        _i14.CategoryCubit(gh<_i11.RecipeCubit>()));
    gh.singleton<_i15.ChangePswdCubit>(
        _i15.ChangePswdCubit(gh<_i7.FirebaseAuthRepository>()));
    gh.singleton<_i16.FavoritesCubit>(_i16.FavoritesCubit(
      gh<_i8.FirebaseRepository>(),
      gh<_i7.FirebaseAuthRepository>(),
    ));
    gh.singleton<_i17.UserCubit>(_i17.UserCubit(
      gh<_i7.FirebaseAuthRepository>(),
      gh<_i11.RecipeCubit>(),
      gh<_i16.FavoritesCubit>(),
    ));
    gh.singleton<_i18.DeleteAccCubit>(_i18.DeleteAccCubit(
      gh<_i7.FirebaseAuthRepository>(),
      gh<_i17.UserCubit>(),
    ));
    return this;
  }
}
