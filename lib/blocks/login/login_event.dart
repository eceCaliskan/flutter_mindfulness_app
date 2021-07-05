import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

///Returns the interaction of the user from the UI as events to the AuthenticationBloc
///@Ece caliskan
///2021

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]);
}

///when a changes made in the email field using [email]
class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({
    @required this.email,
  }) : super([email]);

  //sending the email to the LoginEvent superclass
  String toString() => 'EmailChanged { email :$email }';
}

///when a changes made in the password field using [password]
class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged({@required this.password}) : super([password]);

  //sending the password to the LoginEvent superclass
  String toString() => 'PasswordChanged { email :$password }';
}

///to log the user in [email, password]
class LoginWithCredentialsPressed extends LoginEvent {
  final String email;
  final String password;

  LoginWithCredentialsPressed({@required this.email, @required this.password})
      : super([email, password]);

//sending the password and email to the LoginEvent superclass
  @override
  String toString() {
    return 'LoginWithCredentialsPressed { email: $email, password: $password }';
  }
}

