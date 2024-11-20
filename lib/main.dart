import 'package:coding_challenge/app/presentation/bloc/app_bloc.dart';
import 'package:coding_challenge/features/login/presentation/cubit/login_cubit.dart';
import 'package:coding_challenge/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:coding_challenge/app/app_bloc_observer.dart';
import 'package:coding_challenge/core/injection/injection.dart';
import 'package:coding_challenge/app/presentation/pages/app.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  await dotenv.load(fileName: '.env');
  await configureInjection(Environment.prod);

  Bloc.observer = AppBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (_) => locator<AppBloc>(),
        ),
        BlocProvider<LoginCubit>(
          create: (_) => locator<LoginCubit>(),
        ),
      ],
      child: const App(),
    ),
  );
}
