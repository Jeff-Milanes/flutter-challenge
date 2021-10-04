import 'package:bloc/bloc.dart';
import 'package:coding_challenge/core/error/exceptions.dart';
import 'package:coding_challenge/features/login/domain/repositories/login_repository.dart';
import 'package:injectable/injectable.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepository) : super(const LoginState());

  final LoginRepository _loginRepository;

  void emailChanged(String email) {
    emit(state.copyWith(email: email, status: LoginStatus.initial));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password, status: LoginStatus.initial));
  }

  Future<void> logInWithCredentials() async {
    emit(state.copyWith(status: LoginStatus.submissionInProgress));
    try {
      await _loginRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(status: LoginStatus.submissionSuccess));
    } on ServerException {
      emit(state.copyWith(status: LoginStatus.submissionFailure));
    }
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: LoginStatus.submissionInProgress));
    try {
      await _loginRepository.logInWithGoogle();
      emit(state.copyWith(status: LoginStatus.submissionSuccess));
    } on ServerException {
      emit(state.copyWith(status: LoginStatus.submissionFailure));
    }
  }

  Future<void> logInWithFacebook() async {
    emit(state.copyWith(status: LoginStatus.submissionInProgress));
    try {
      await _loginRepository.logInWithFacebook();
      emit(state.copyWith(status: LoginStatus.submissionSuccess));
    } on ServerException {
      emit(state.copyWith(status: LoginStatus.submissionFailure));
    }
  }
}
