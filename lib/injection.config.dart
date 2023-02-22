// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:przepisy_sylwii_mobile/core/add_photo_cubit/add_photo_cubit.dart'
    as _i3;
import 'package:przepisy_sylwii_mobile/core/amount_cubit/amount_cubit.dart'
    as _i4;
import 'package:przepisy_sylwii_mobile/core/category_cubit/category_cubit.dart'
    as _i11;
import 'package:przepisy_sylwii_mobile/core/change_pswd_cubit/change_pswd_cubit.dart'
    as _i12;
import 'package:przepisy_sylwii_mobile/core/delete_acc_cubit/delete_acc_cubit.dart'
    as _i15;
import 'package:przepisy_sylwii_mobile/core/favorites_cubit/favorites_cubit.dart'
    as _i13;
import 'package:przepisy_sylwii_mobile/core/forgot_pswd_cubit/forgot_pswd_cubit.dart'
    as _i7;
import 'package:przepisy_sylwii_mobile/core/login_cubit/login_cubit.dart'
    as _i8;
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart'
    as _i9;
import 'package:przepisy_sylwii_mobile/core/register_cubit/register_cubit.dart'
    as _i10;
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart' as _i14;
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart'
    as _i5;
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart'
    as _i6;

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
    gh.singleton<_i3.AddPhotoCubit>(_i3.AddPhotoCubit());
    gh.singleton<_i4.AmountCubit>(_i4.AmountCubit());
    gh.factory<_i5.FirebaseAuthRepository>(() => _i5.FirebaseAuthRepository());
    gh.factory<_i6.FirebaseRepository>(() => _i6.FirebaseRepository());
    gh.singleton<_i7.ForgotPswdCubit>(
        _i7.ForgotPswdCubit(gh<_i5.FirebaseAuthRepository>()));
    gh.singleton<_i8.LoginCubit>(
        _i8.LoginCubit(gh<_i5.FirebaseAuthRepository>()));
    gh.singleton<_i9.RecipeCubit>(
        _i9.RecipeCubit(gh<_i6.FirebaseRepository>()));
    gh.singleton<_i10.RegisterCubit>(
        _i10.RegisterCubit(gh<_i5.FirebaseAuthRepository>()));
    gh.singleton<_i11.CategoryCubit>(_i11.CategoryCubit(gh<_i9.RecipeCubit>()));
    gh.singleton<_i12.ChangePswdCubit>(
        _i12.ChangePswdCubit(gh<_i5.FirebaseAuthRepository>()));
    gh.singleton<_i13.FavoritesCubit>(_i13.FavoritesCubit(
      gh<_i6.FirebaseRepository>(),
      gh<_i5.FirebaseAuthRepository>(),
    ));
    gh.singleton<_i14.UserCubit>(_i14.UserCubit(
      gh<_i5.FirebaseAuthRepository>(),
      gh<_i9.RecipeCubit>(),
      gh<_i13.FavoritesCubit>(),
    ));
    gh.singleton<_i15.DeleteAccCubit>(_i15.DeleteAccCubit(
      gh<_i5.FirebaseAuthRepository>(),
      gh<_i14.UserCubit>(),
    ));
    return this;
  }
}
