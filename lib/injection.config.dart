// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:silk_innovation_utsav/app/database/secure_storage.dart' as _i7;
import 'package:silk_innovation_utsav/app/database/user_dao.dart' as _i8;
import 'package:silk_innovation_utsav/core/data/base_remote_data_source.dart'
    as _i9;
import 'package:silk_innovation_utsav/core/data/error_handler.dart' as _i10;
import 'package:silk_innovation_utsav/core/network/network_info.dart' as _i6;
import 'package:silk_innovation_utsav/features/home/presentation/cubit/card_cubit.dart'
    as _i3;
import 'package:silk_innovation_utsav/features/login/data/data_source/login_remote_dara_source.dart'
    as _i11;
import 'package:silk_innovation_utsav/features/login/data/repository/login_repository_impl.dart'
    as _i13;
import 'package:silk_innovation_utsav/features/login/domain/repository/login_repository.dart'
    as _i12;
import 'package:silk_innovation_utsav/features/login/domain/usecase/login_user.dart'
    as _i14;
import 'package:silk_innovation_utsav/features/login/presentation/cubit/login_cubit.dart'
    as _i15;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.CardCubit>(() => _i3.CardCubit());
    gh.lazySingleton<_i4.Client>(() => registerModule.client);
    gh.lazySingleton<_i5.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.lazySingleton<_i6.NetworkInfo>(
        () => _i6.NetworkInfoImpl(gh<_i5.InternetConnectionChecker>()));
    gh.lazySingleton<_i7.SecureStorage>(() => _i7.SecureStorage());
    gh.lazySingleton<_i8.UserDao>(() => _i8.UserDao(gh<_i7.SecureStorage>()));
    gh.lazySingleton<_i9.BaseRemoteDataSource>(
        () => _i9.BaseRemoteDataSourceImpl(
              gh<_i4.Client>(),
              gh<_i8.UserDao>(),
            ));
    gh.lazySingleton<_i10.ErrorHandler>(
        () => _i10.ErrorHandler(gh<_i6.NetworkInfo>()));
    gh.lazySingleton<_i11.LoginRemoteDataSource>(
        () => _i11.LoginRemoteDataSource(
              gh<_i4.Client>(),
              gh<_i8.UserDao>(),
            ));
    gh.lazySingleton<_i12.LoginRepository>(() => _i13.LoginRepositoryImpl(
          loginRemoteDataSource: gh<_i11.LoginRemoteDataSource>(),
          errorHandler: gh<_i10.ErrorHandler>(),
        ));
    gh.lazySingleton<_i14.LoginUser>(
        () => _i14.LoginUser(gh<_i12.LoginRepository>()));
    gh.singleton<_i15.LoginCubit>(_i15.LoginCubit(
      gh<_i14.LoginUser>(),
      gh<_i8.UserDao>(),
    ));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
