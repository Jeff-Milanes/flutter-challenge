// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i8;
import 'package:graphql_flutter/graphql_flutter.dart' as _i9;
import 'package:hive/hive.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i10;

import '../../app/domain/repositories/app_repository.dart' as _i14;
import '../../app/presentation/bloc/app_bloc.dart' as _i16;
import '../../app/presentation/view/app.dart' as _i3;
import '../../features/login/domain/repositories/login_repository.dart' as _i12;
import '../../features/login/presentation/cubit/login_cubit.dart' as _i15;
import '../../features/login/presentation/pages/login_page.dart' as _i11;
import '../network/network_info.dart' as _i13;
import 'register_module.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.App>(() => _i3.App(key: get<_i4.Key>()));
  await gh.lazySingletonAsync<_i5.Box<dynamic>>(() => registerModule.openBox,
      preResolve: true);
  gh.lazySingleton<_i6.FacebookAuth>(() => registerModule.facebookAuth);
  await gh.lazySingletonAsync<_i7.FirebaseAuth>(
      () => registerModule.firebaseAuth,
      preResolve: true);
  gh.lazySingleton<_i8.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.lazySingleton<_i9.GraphQLClient>(() => registerModule.gqlClient);
  gh.lazySingleton<_i10.InternetConnectionChecker>(
      () => registerModule.connectionChecker);
  gh.factory<_i11.LoginPage>(() => _i11.LoginPage(key: get<_i4.Key>()));
  gh.lazySingleton<_i12.LoginRepository>(() => _i12.ImpLoginRepository(
      get<_i7.FirebaseAuth>(),
      get<_i8.GoogleSignIn>(),
      get<_i6.FacebookAuth>()));
  gh.lazySingleton<_i13.NetworkInfo>(
      () => _i13.NetworkInfo(get<_i10.InternetConnectionChecker>()));
  gh.lazySingleton<_i14.AppRepository>(
      () => _i14.ImpAppRepository(get<_i7.FirebaseAuth>()));
  gh.factory<_i15.LoginCubit>(
      () => _i15.LoginCubit(get<_i12.LoginRepository>()));
  gh.factory<_i16.AppBloc>(() => _i16.AppBloc(get<_i14.AppRepository>()));
  return get;
}

class _$RegisterModule extends _i17.RegisterModule {}
