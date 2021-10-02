import 'package:coding_challenge/app/app_bloc_observer.dart';
import 'package:coding_challenge/app/presentation/bloc/app_bloc.dart';
import 'package:coding_challenge/app/presentation/view/app.dart';
import 'package:coding_challenge/core/injection/injection.dart';
import 'package:coding_challenge/features/login/presentation/cubit/login_cubit.dart';
import 'package:coding_challenge/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureInjection(Environment.prod);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (_) => locator<AppBloc>(),
          child: const App(),
        ),
        BlocProvider<LoginCubit>(
          create: (_) => locator<LoginCubit>(),
          child: const LoginPage(),
        )
      ],
      child: const App(),
    ),
  );
}
