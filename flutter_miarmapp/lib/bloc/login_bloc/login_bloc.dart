import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_miarmapp/bloc/login_bloc/login_state.dart';
import 'package:flutter_miarmapp/repository/auth_repository/auth_repository.dart';

import 'package:flutter_miarmapp/bloc/login_bloc/login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginInitialState()) {
    on<DoLoginEvent>(_doLoginEvent);
  }

  void _doLoginEvent(DoLoginEvent event, Emitter<LoginState> emit) async {
    try {
      final loginResponse = await authRepository.login(event.loginDto);
      emit(LoginSuccessState(loginResponse));
      return;
    } on Exception catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
}