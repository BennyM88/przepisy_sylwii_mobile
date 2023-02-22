// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:przepisy_sylwii_mobile/core/add_ingredients_cubit/add_ingredients_cubit.dart'
    as _i3;
import 'package:przepisy_sylwii_mobile/core/add_photo_cubit/add_photo_cubit.dart'
    as _i4;
import 'package:przepisy_sylwii_mobile/core/amount_cubit/amount_cubit.dart'
    as _i5;
import 'package:przepisy_sylwii_mobile/core/category_cubit/category_cubit.dart'
    as _i12;
import 'package:przepisy_sylwii_mobile/core/change_pswd_cubit/change_pswd_cubit.dart'
    as _i13;
import 'package:przepisy_sylwii_mobile/core/delete_acc_cubit/delete_acc_cubit.dart'
    as _i16;
import 'package:przepisy_sylwii_mobile/core/favorites_cubit/favorites_cubit.dart'
    as _i14;
import 'package:przepisy_sylwii_mobile/core/forgot_pswd_cubit/forgot_pswd_cubit.dart'
    as _i8;
import 'package:przepisy_sylwii_mobile/core/login_cubit/login_cubit.dart'
    as _i9;
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart'
    as _i10;
import 'package:przepisy_sylwii_mobile/core/register_cubit/register_cubit.dart'
    as _i11;
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart' as _i15;
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart'
    as _i6;
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart'
    as _i7;

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
    gh.singleton<_i5.AmountCubit>(_i5.AmountCubit());
    gh.factory<_i6.FirebaseAuthRepository>(() => _i6.FirebaseAuthRepository());
    gh.factory<_i7.FirebaseRepository>(() => _i7.FirebaseRepository());
    gh.singleton<_i8.ForgotPswdCubit>(
        _i8.ForgotPswdCubit(gh<_i6.FirebaseAuthRepository>()));
    gh.singleton<_i9.LoginCubit>(
        _i9.LoginCubit(gh<_i6.FirebaseAuthRepository>()));
    gh.singleton<_i10.RecipeCubit>(
        _i10.RecipeCubit(gh<_i7.FirebaseRepository>()));
    gh.singleton<_i11.RegisterCubit>(
        _i11.RegisterCubit(gh<_i6.FirebaseAuthRepository>()));
    gh.singleton<_i12.CategoryCubit>(
        _i12.CategoryCubit(gh<_i10.RecipeCubit>()));
    gh.singleton<_i13.ChangePswdCubit>(
        _i13.ChangePswdCubit(gh<_i6.FirebaseAuthRepository>()));
    gh.singleton<_i14.FavoritesCubit>(_i14.FavoritesCubit(
      gh<_i7.FirebaseRepository>(),
      gh<_i6.FirebaseAuthRepository>(),
    ));
    gh.singleton<_i15.UserCubit>(_i15.UserCubit(
      gh<_i6.FirebaseAuthRepository>(),
      gh<_i10.RecipeCubit>(),
      gh<_i14.FavoritesCubit>(),
    ));
    gh.singleton<_i16.DeleteAccCubit>(_i16.DeleteAccCubit(
      gh<_i6.FirebaseAuthRepository>(),
      gh<_i15.UserCubit>(),
    ));
    return this;
  }
}
