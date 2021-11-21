import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = AuthRepository();

  void _mapAuthRegisterToState(
      AuthRegisterEvent event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthStartState());
      await _authRepository.signUp(
        event.email,
        event.password,
      );
      emit(const AuthLoggedInState());
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  void _mapAuthLoginToState(
      AuthLoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthStartState());
      await _authRepository.signInWithCredentials(event.email, event.password);
      emit(const AuthLoggedInState());
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  void _mapAuthLogoutToState(
      AuthLogOutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthStartState());
      await _authRepository.signOut();
      emit(const AuthLoggedOutState());
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  void _mapAuthIsLoggedInToState(
      AuthIsLoggedInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthStartState());
      if (_authRepository.isSignedIn()) {
        emit(const AuthUserExistsState());
      } else {
        emit(const AuthUnknownState());
      }
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  void _mapAuthUpdateUsernameToState(
      AuthUpdateUserNameEvent event, Emitter<AuthState> emit) async {
    try {
      emit(const AuthStartState());
      await _authRepository.updateUsername(event.username);
      emit(const AuthUpdateUsernameState());
    } catch (e) {
      emit(AuthFailedState(e.toString()));
    }
  }

  AuthBloc() : super(const AuthUnknownState()) {
    on<AuthLoginEvent>(_mapAuthLoginToState);

    on<AuthRegisterEvent>(_mapAuthRegisterToState);

    on<AuthLogOutEvent>(_mapAuthLogoutToState);

    on<AuthIsLoggedInEvent>(_mapAuthIsLoggedInToState);

    on<AuthUpdateUserNameEvent>(_mapAuthUpdateUsernameToState);
  }
}
