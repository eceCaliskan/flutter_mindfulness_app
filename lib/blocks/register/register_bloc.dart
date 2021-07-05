import 'package:flutter_app/blocks/login/validator.dart';
import 'package:flutter_app/blocks/register/register_event.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/blocks/register/register_state.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository _userRepository;

  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  RegisterState get initialState => EmptyRegister();

//returning events to state
  @override
  Stream<RegisterState> mapEventToState(
      currentstate, RegisterEvent event,
      ) async* {
    if (event is EmailChanged) {  //checking the validity of email
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) { //checking the validity of password
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is Submitted) { //submitting details
      yield* _mapFormSubmittedToState(event.email, event.password, event.username);
    }
  }

  //checking the validity of email
  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    if (!Validators.isValidEmail(email)) { //email is invalid
      yield RegisterEmailFailure();
    } else if (Validators.isValidEmail(email)){//email is valid
      yield RegisterSuccessEmailPassword();
    }
  }
//checking the validity of password
  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    if (!Validators.isValidPassword(password)) { //password invalid
      yield RegisterPasswordFailure();
    } else if (Validators.isValidPassword(password)){ //password valid
      yield RegisterSuccessEmailPassword();
    }
  }
//submitting details to the authentication services and create the user document
//  on cloud firestore
  Stream<RegisterState> _mapFormSubmittedToState(
      String email,
      String password,
      String username

  ) async* {
    yield Loading();

    try {
      print(username);
      print(email);
      print(password);

      //google authentication
      await _userRepository.signUpWithEmail(email: email, password:  password);
      //cloud firebase
      _userRepository.addUserToDatabase(username);
      yield RegisterSuccess();
    } catch (_) {
      yield Failure();
    }
  }
}