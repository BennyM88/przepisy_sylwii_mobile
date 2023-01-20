// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:przepisy_sylwii_mobile/core/category_cubit/category_cubit.dart'
    as _i8;
import 'package:przepisy_sylwii_mobile/core/login_cubit/login_cubit.dart'
    as _i5;
import 'package:przepisy_sylwii_mobile/core/recipe_cubit/recipe_cubit.dart'
    as _i6;
import 'package:przepisy_sylwii_mobile/core/user_cubit/user_cubit.dart' as _i7;
import 'package:przepisy_sylwii_mobile/services/firebase_auth_repository/firebase_auth_repository.dart'
    as _i3;
import 'package:przepisy_sylwii_mobile/services/firebase_repository/firebase_repository.dart'
    as _i4;

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
    gh.factory<_i3.FirebaseAuthRepository>(() => _i3.FirebaseAuthRepository());
    gh.factory<_i4.FirebaseRepository>(() => _i4.FirebaseRepository());
    gh.singleton<_i5.LoginCubit>(
        _i5.LoginCubit(gh<_i3.FirebaseAuthRepository>()));
    gh.singleton<_i6.RecipeCubit>(
        _i6.RecipeCubit(gh<_i4.FirebaseRepository>()));
    gh.singleton<_i7.UserCubit>(
        _i7.UserCubit(gh<_i3.FirebaseAuthRepository>()));
    gh.singleton<_i8.CategoryCubit>(_i8.CategoryCubit(gh<_i6.RecipeCubit>()));
    return this;
  }
}
