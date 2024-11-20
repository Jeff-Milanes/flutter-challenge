import 'package:coding_challenge/features/login/presentation/cubit/login_cubit.dart';
import 'package:coding_challenge/features/login/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == LoginStatus.submissionFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Login Failed')),
                );
            }
          },
          child: Align(
            alignment: const Alignment(0, -1 / 5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _EmailInput(),
                  const SizedBox(height: 8),
                  _PasswordInput(),
                  const SizedBox(height: 8),
                  LoginButton(
                    label: 'LOGIN',
                    buttonColor: Colors.yellow,
                    onPressed: () =>
                        context.read<LoginCubit>().logInWithCredentials(),
                  ),
                  // TODO: Need to setup
                  // const SizedBox(height: 30),
                  // LoginButton(
                  //   label: 'SIGN IN WITH GOOGLE',
                  //   icon: FontAwesomeIcons.google,
                  //   buttonColor: Colors.red,
                  //   onPressed: () =>
                  //       context.read<LoginCubit>().logInWithGoogle(),
                  // ),
                  // const SizedBox(height: 4),
                  // LoginButton(
                  //   label: 'SIGN IN WITH FACEBOOK',
                  //   icon: FontAwesomeIcons.facebook,
                  //   onPressed: () =>
                  //       context.read<LoginCubit>().logInWithFacebook(),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          decoration: const InputDecoration(
            labelText: 'Email',
            helperText: '',
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          obscureText: true,
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          decoration: const InputDecoration(
            labelText: 'Password',
            helperText: '',
          ),
        );
      },
    );
  }
}
