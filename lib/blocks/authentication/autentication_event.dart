import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

///Returns the interaction of the user from the UI as events to the AuthenticationBloc
///@Ece caliskan
///2021

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]);
}

//the application started
class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

//when user registers or sign in to the application
class LoggedIn extends AuthenticationEvent {
  @override
  String toString() => 'LoggedIn';
}

//when the user logs out
class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
