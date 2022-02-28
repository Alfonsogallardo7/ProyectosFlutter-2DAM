import 'package:equatable/equatable.dart';
import 'package:flutter_miarmapp/models/login_response.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class DoLoginEvent extends LoginEvent {
  final LoginDto loginDto;

  const DoLoginEvent(this.loginDto);
}
