import 'package:flutter/foundation.dart';
import 'package:flutter_app/blocks/login/login_event.dart';
import 'package:flutter_app/blocks/login/login_state.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/blocks/login/validator.dart';
import 'package:flutter_app/userRepository/userRepository.dart';

///The Login bloc class returns the Login events to login States
///with the help of flutter_bloc
///@Ece caliskan
///2021

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginInitial(); //setting the initial state

  @override
  //gettting the events to call the corresponding methods. The methods are used
  //to convert the return the state
  Stream<LoginState> mapEventToState(currentState, LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  ///checks the validity of the email with [email]
  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    if (!Validators.isValidEmail(email)) {
      //email is invalid
      yield EmailFailure();
    } else {
      //email is valid
      yield SuccessEmailPassword();
    }
  }

  ///checks the validity of the password with [password]
  Stream<LoginState> _mapPasswordChangedState(String password) async* {
    if (!Validators.isValidPassword(password)) {
      //password invalid
      yield PasswordFailure();
    } else {
      //password valid
      yield SuccessEmailPassword();
    }
  }

  ///logs the user in by calling the Userrepository class and returns the corresponding
  ///state of the login.
  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
  // yield LoginLoading();  //sign in error
    try {
      await _userRepository.signInWithEmail(email: email, password: password);
      yield LoginSuccess(); //signin successful
    } catch (_) {
      yield LoginFailure(error: null); //sign in error
    }
  }
}
