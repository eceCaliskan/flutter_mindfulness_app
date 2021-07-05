import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const []]) ;
}

//When an email added to the email text field
class EmailChanged extends RegisterEvent {
  final String email;

  EmailChanged({@required this.email}) : super([email]);

  @override
  String toString() => 'EmailChanged { email :$email }';
}

//When a password added to the password text field
class PasswordChanged extends RegisterEvent {
  final String password;

  PasswordChanged({@required this.password}) : super([password]);

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

//submitting the form
class Submitted extends RegisterEvent {
  final String email;
  final String password;
  final String username;

  Submitted({@required this.email, @required this.password, @required  this.username})
      : super([email, password, username]);

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password, username: $username }';
  }
}


