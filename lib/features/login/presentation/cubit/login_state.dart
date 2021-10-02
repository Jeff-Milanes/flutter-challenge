part of 'login_cubit.dart';

class LoginState {
  const LoginState({
    this.email = '',
    this.password = '',
    this.status = LoginStatus.initial,
  });

  final String email;
  final String password;
  final LoginStatus status;

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status);
  }
}

enum LoginStatus {
  initial,
  submissionInProgress,
  submissionSuccess,
  submissionFailure
}
