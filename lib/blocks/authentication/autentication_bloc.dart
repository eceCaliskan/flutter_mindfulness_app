import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'autentication_event.dart';
import 'autentication_state.dart';

///The Authentication bloc class returns the Authentication events to Authentication States
///with the help of flutter_bloc
///@Ece caliskan
///2021

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;


  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized(); // initializing the primary state

  ///recives event and calls methods to convert them to the states using [currentstate, event] parameters
  @override
  Stream<AuthenticationState> mapEventToState(
     currentstate, AuthenticationEvent event,
      ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) { //user registers or logs in
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {//user logs out
      yield* _mapLoggedOutToState();
    }
  }

  ///when the application started it gets the username of the user and checks if the
  ///user signed in or registered.
  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        final name = await _userRepository.getName();//returns the username
        yield Authenticated(name);
      } else {//user did not signed-in
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  //when the user signed in or registered, returns the username
  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(await _userRepository.getName());
  }

  //signs the user out of the application
  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }
}