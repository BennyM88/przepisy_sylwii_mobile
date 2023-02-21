// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:przepisy_sylwii_mobile/core/add_photo_cubit/add_photo_cubit.dart'
    as _i3;
import 'package:przepisy_sylwii_mobile/core/category_cubit/category_cubit.dart'
    as _i10;
import 'package:przepisy_sylwii_mobile/core/change_pswd_cubit/change_pswd_cubit.dart'
    as _i11;
import 'package:przepisy_sylwii_mobile/core/delete_acc_cubit/delete_acc_cubit.dart'
    as _i14;
import 'package:przepisy_sylwii_mobile/core/favorites_cubit/favorites_cubit.dart'
    as _i12;
import 'package:przepisy_sylwii_mobile/core/forgot_pswd_cubit/forgot_pswd_cubit.dart'
    as _i6;
import 'package:przepisy_sylwii_mobile/core/login_cubit/login_cubit.dart'
    as _i7;
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart'
    as _i8;
import 'package:przepisy_sylwii_mobile/core/register_cubit/register_cubit.dart'
    as _i9;
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart' as _i13;
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart'
    as _i4;
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart'
    as _i5;

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
    gh.factory<_i4.FirebaseAuthRepository>(() => _i4.FirebaseAuthRepository());
    gh.factory<_i5.FirebaseRepository>(() => _i5.FirebaseRepository());
    gh.singleton<_i6.ForgotPswdCubit>(
        _i6.ForgotPswdCubit(gh<_i4.FirebaseAuthRepository>()));
    gh.singleton<_i7.LoginCubit>(
        _i7.LoginCubit(gh<_i4.FirebaseAuthRepository>()));
    gh.singleton<_i8.RecipeCubit>(
        _i8.RecipeCubit(gh<_i5.FirebaseRepository>()));
    gh.singleton<_i9.RegisterCubit>(
        _i9.RegisterCubit(gh<_i4.FirebaseAuthRepository>()));
    gh.singleton<_i10.CategoryCubit>(_i10.CategoryCubit(gh<_i8.RecipeCubit>()));
    gh.singleton<_i11.ChangePswdCubit>(
        _i11.ChangePswdCubit(gh<_i4.FirebaseAuthRepository>()));
    gh.singleton<_i12.FavoritesCubit>(_i12.FavoritesCubit(
      gh<_i5.FirebaseRepository>(),
      gh<_i4.FirebaseAuthRepository>(),
    ));
    gh.singleton<_i13.UserCubit>(_i13.UserCubit(
      gh<_i4.FirebaseAuthRepository>(),
      gh<_i8.RecipeCubit>(),
      gh<_i12.FavoritesCubit>(),
    ));
    gh.singleton<_i14.DeleteAccCubit>(_i14.DeleteAccCubit(
      gh<_i4.FirebaseAuthRepository>(),
      gh<_i13.UserCubit>(),
    ));
    return this;
  }
}
