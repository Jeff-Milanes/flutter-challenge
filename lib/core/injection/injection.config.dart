// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:coding_challenge/app/domain/repositories/app_repository.dart'
    as _i607;
import 'package:coding_challenge/app/presentation/bloc/app_bloc.dart' as _i911;
import 'package:coding_challenge/app/presentation/cubit/tab_view_cubit.dart'
    as _i128;
import 'package:coding_challenge/core/injection/register_module.dart' as _i411;
import 'package:coding_challenge/core/network/network_info.dart' as _i174;
import 'package:coding_challenge/features/calculator/presentation/cubit/calculator_cubit.dart'
    as _i406;
import 'package:coding_challenge/features/location/data/datasources/location_datasource.dart'
    as _i295;
import 'package:coding_challenge/features/location/domain/repositories/location_repository.dart'
    as _i902;
import 'package:coding_challenge/features/location/presentation/bloc/location_bloc.dart'
    as _i509;
import 'package:coding_challenge/features/login/domain/repositories/login_repository.dart'
    as _i442;
import 'package:coding_challenge/features/login/presentation/cubit/login_cubit.dart'
    as _i638;
import 'package:coding_challenge/features/news_feed/data/datasources/news_feed_datasource.dart'
    as _i329;
import 'package:coding_challenge/features/news_feed/domain/repositories/news_repository.dart'
    as _i211;
import 'package:coding_challenge/features/news_feed/presentation/cubit/news_cubit.dart'
    as _i227;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i806;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:graphql_flutter/graphql_flutter.dart' as _i128;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:location/location.dart' as _i645;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i128.TabViewCubit>(() => _i128.TabViewCubit());
    gh.factory<_i406.CalculatorCubit>(() => _i406.CalculatorCubit());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => registerModule.connectionChecker);
    gh.lazySingleton<_i128.GraphQLClient>(() => registerModule.gqlClient);
    await gh.lazySingletonAsync<_i979.Box<dynamic>>(
      () => registerModule.openBox,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i59.FirebaseAuth>(
      () => registerModule.firebaseAuth,
      preResolve: true,
    );
    gh.lazySingleton<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.lazySingleton<_i806.FacebookAuth>(() => registerModule.facebookAuth);
    gh.lazySingleton<_i645.Location>(() => registerModule.location);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i295.LocationDataSource>(
        () => _i295.ImpLocationDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i902.LocationRepository>(
        () => _i902.ImpLocationRepository(gh<_i295.LocationDataSource>()));
    gh.lazySingleton<_i329.NewsFeedDataSource>(
        () => _i329.ImpNewsFeedDataSource(gh<_i361.Dio>()));
    gh.factory<_i509.LocationBloc>(() => _i509.LocationBloc(
          gh<_i645.Location>(),
          gh<_i902.LocationRepository>(),
        ));
    gh.lazySingleton<_i607.AppRepository>(
        () => _i607.ImpAppRepository(gh<_i59.FirebaseAuth>()));
    gh.lazySingleton<_i442.LoginRepository>(() => _i442.ImpLoginRepository(
          gh<_i59.FirebaseAuth>(),
          gh<_i116.GoogleSignIn>(),
          gh<_i806.FacebookAuth>(),
        ));
    gh.lazySingleton<_i174.NetworkInfo>(
        () => _i174.NetworkInfo(gh<_i973.InternetConnectionChecker>()));
    gh.factory<_i911.AppBloc>(() => _i911.AppBloc(gh<_i607.AppRepository>()));
    gh.lazySingleton<_i211.NewsRepository>(
        () => _i211.ImpNewsRepository(gh<_i329.NewsFeedDataSource>()));
    gh.factory<_i638.LoginCubit>(
        () => _i638.LoginCubit(gh<_i442.LoginRepository>()));
    gh.factory<_i227.NewsCubit>(
        () => _i227.NewsCubit(gh<_i211.NewsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i411.RegisterModule {}
