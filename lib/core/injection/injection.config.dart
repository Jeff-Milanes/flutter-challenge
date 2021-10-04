// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:graphql_flutter/graphql_flutter.dart' as _i9;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i10;
import 'package:location/location.dart' as _i11;

import '../../app/domain/repositories/app_repository.dart' as _i19;
import '../../app/presentation/bloc/app_bloc.dart' as _i23;
import '../../app/presentation/cubit/tab_view_cubit.dart' as _i18;
import '../../features/calculator/presentation/cubit/calculator_cubit.dart'
    as _i4;
import '../../features/location/data/datasources/location_datasource.dart'
    as _i12;
import '../../features/location/domain/repositories/location_repository.dart'
    as _i13;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i20;
import '../../features/login/domain/repositories/login_repository.dart' as _i14;
import '../../features/login/presentation/cubit/login_cubit.dart' as _i21;
import '../../features/news_feed/data/datasources/news_feed_datasource.dart'
    as _i16;
import '../../features/news_feed/domain/repositories/news_repository.dart'
    as _i17;
import '../../features/news_feed/presentation/cubit/news_cubit.dart' as _i22;
import '../network/network_info.dart' as _i15;
import 'register_module.dart' as _i24; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.lazySingletonAsync<_i3.Box<dynamic>>(() => registerModule.openBox,
      preResolve: true);
  gh.factory<_i4.CalculatorCubit>(() => _i4.CalculatorCubit());
  gh.lazySingleton<_i5.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i6.FacebookAuth>(() => registerModule.facebookAuth);
  await gh.lazySingletonAsync<_i7.FirebaseAuth>(
      () => registerModule.firebaseAuth,
      preResolve: true);
  gh.lazySingleton<_i8.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i9.GraphQLClient>(() => registerModule.gqlClient);
  gh.lazySingleton<_i10.InternetConnectionChecker>(
      () => registerModule.connectionChecker);
  gh.lazySingleton<_i11.Location>(() => registerModule.location);
  gh.lazySingleton<_i12.LocationDataSource>(
      () => _i12.ImpLocationDataSource(get<_i5.Dio>()));
  gh.lazySingleton<_i13.LocationRepository>(
      () => _i13.ImpLocationRepository(get<_i12.LocationDataSource>()));
  gh.lazySingleton<_i14.LoginRepository>(() => _i14.ImpLoginRepository(
      get<_i7.FirebaseAuth>(),
      get<_i8.GoogleSignIn>(),
      get<_i6.FacebookAuth>()));
  gh.lazySingleton<_i15.NetworkInfo>(
      () => _i15.NetworkInfo(get<_i10.InternetConnectionChecker>()));
  gh.lazySingleton<_i16.NewsFeedDataSource>(
      () => _i16.ImpNewsFeedDataSource(get<_i5.Dio>()));
  gh.lazySingleton<_i17.NewsRepository>(
      () => _i17.ImpNewsRepository(get<_i16.NewsFeedDataSource>()));
  gh.factory<_i18.TabViewCubit>(() => _i18.TabViewCubit());
  gh.lazySingleton<_i19.AppRepository>(
      () => _i19.ImpAppRepository(get<_i7.FirebaseAuth>()));
  gh.factory<_i20.LocationBloc>(() =>
      _i20.LocationBloc(get<_i11.Location>(), get<_i13.LocationRepository>()));
  gh.factory<_i21.LoginCubit>(
      () => _i21.LoginCubit(get<_i14.LoginRepository>()));
  gh.factory<_i22.NewsCubit>(() => _i22.NewsCubit(get<_i17.NewsRepository>()));
  gh.factory<_i23.AppBloc>(() => _i23.AppBloc(get<_i19.AppRepository>()));
  return get;
}

class _$RegisterModule extends _i24.RegisterModule {}
