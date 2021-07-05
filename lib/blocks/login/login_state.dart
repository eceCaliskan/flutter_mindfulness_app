import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

///Returns the state according to the LoginBloc call
///@Ece caliskan
///2021

abstract class LoginState extends Equatable{
  @override
  List<Object> get props => [];
}
//the user opened the application
class LoginInitial extends LoginState {}

//email couldn't get accepted by the validator class
class EmailFailure extends LoginState {}

//email and password validated
class SuccessEmailPassword extends LoginState {}

//password couldn't get accepted by the validator class
class PasswordFailure extends LoginState {}

//login operation achieved
class LoginSuccess extends LoginState {}

//login operation couldn't achieved
class LoginFailure extends LoginState {
  final String error;

  LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];
}
