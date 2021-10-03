import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coding_challenge/app/data/models/user.dart';
import 'package:coding_challenge/app/domain/repositories/app_repository.dart';
import 'package:coding_challenge/core/enum/app_status.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(this._appRepository) : super(const AppState.unauthenticated()) {
    on<AppUserChanged>(_onUserChanged);

    _userSubscription = _appRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  final AppRepository _appRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(event.user.isNotEmpty
        ? AppState.authenticated(event.user)
        : const AppState.unauthenticated());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
