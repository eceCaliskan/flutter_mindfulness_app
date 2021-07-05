import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

///Returns the state according to the AuthenticationBloc call
///@Ece caliskan
///2021

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]);
}

//the user is not signed in or registered
class Uninitialized extends AuthenticationState {}

//the user registered or signed in
class Authenticated extends AuthenticationState {
  final String username;

  Authenticated(this.username) : super([username]);

  @override
  String toString() => 'Authenticated { displayName: $username }';
}

//the user signed out
class Unauthenticated extends AuthenticationState {}
