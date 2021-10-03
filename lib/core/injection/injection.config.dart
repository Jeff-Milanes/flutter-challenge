// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i7;
import 'package:graphql_flutter/graphql_flutter.dart' as _i8;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;
import 'package:location/location.dart' as _i10;

import '../../app/domain/repositories/app_repository.dart' as _i18;
import '../../app/presentation/bloc/app_bloc.dart' as _i22;
import '../../app/presentation/cubit/tab_view_cubit.dart' as _i17;
import '../../features/location/data/datasources/location_datasource.dart'
    as _i11;
import '../../features/location/domain/repositories/location_repository.dart'
    as _i12;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i19;
import '../../features/login/domain/repositories/login_repository.dart' as _i13;
import '../../features/login/presentation/cubit/login_cubit.dart' as _i20;
import '../../features/news_feed/data/datasources/news_feed_datasource.dart'
    as _i15;
import '../../features/news_feed/domain/repositories/news_repository.dart'
    as _i16;
import '../../features/news_feed/presentation/cubit/news_cubit.dart' as _i21;
import '../network/network_info.dart' as _i14;
import 'register_module.dart' as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.lazySingletonAsync<_i3.Box<dynamic>>(() => registerModule.openBox,
      preResolve: true);
  gh.lazySingleton<_i4.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i5.FacebookAuth>(() => registerModule.facebookAuth);
  await gh.lazySingletonAsync<_i6.FirebaseAuth>(
      () => registerModule.firebaseAuth,
      preResolve: true);
  gh.lazySingleton<_i7.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i8.GraphQLClient>(() => registerModule.gqlClient);
  gh.lazySingleton<_i9.InternetConnectionChecker>(
      () => registerModule.connectionChecker);
  gh.lazySingleton<_i10.Location>(() => registerModule.location);
  gh.lazySingleton<_i11.LocationDataSource>(
      () => _i11.ImpLocationDataSource(get<_i4.Dio>()));
  gh.lazySingleton<_i12.LocationRepository>(
      () => _i12.ImpLocationRepository(get<_i11.LocationDataSource>()));
  gh.lazySingleton<_i13.LoginRepository>(() => _i13.ImpLoginRepository(
      get<_i6.FirebaseAuth>(),
      get<_i7.GoogleSignIn>(),
      get<_i5.FacebookAuth>()));
  gh.lazySingleton<_i14.NetworkInfo>(
      () => _i14.NetworkInfo(get<_i9.InternetConnectionChecker>()));
  gh.lazySingleton<_i15.NewsFeedDataSource>(
      () => _i15.ImpNewsFeedDataSource(get<_i4.Dio>()));
  gh.lazySingleton<_i16.NewsRepository>(
      () => _i16.ImpNewsRepository(get<_i15.NewsFeedDataSource>()));
  gh.factory<_i17.TabViewCubit>(() => _i17.TabViewCubit());
  gh.lazySingleton<_i18.AppRepository>(
      () => _i18.ImpAppRepository(get<_i6.FirebaseAuth>()));
  gh.factory<_i19.LocationBloc>(() =>
      _i19.LocationBloc(get<_i10.Location>(), get<_i12.LocationRepository>()));
  gh.factory<_i20.LoginCubit>(
      () => _i20.LoginCubit(get<_i13.LoginRepository>()));
  gh.factory<_i21.NewsCubit>(() => _i21.NewsCubit(get<_i16.NewsRepository>()));
  gh.factory<_i22.AppBloc>(() => _i22.AppBloc(get<_i18.AppRepository>()));
  return get;
}

class _$RegisterModule extends _i23.RegisterModule {}
