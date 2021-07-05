import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/blocks/login/login_bloc.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'loginForm.dart';

//Provides the structure of the login page and includes the login form

class LoginScreen extends StatefulWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  State<LoginScreen> createState() => _LoginScreen(); //cretating the state
}

class _LoginScreen extends State<LoginScreen> {
  LoginBloc _loginBloc;
  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    //assigning the user repository to the bloc
    _loginBloc = LoginBloc(userRepository: _userRepository,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Sign in',style: TextStyle(fontSize: 25, color:Color(0xFF969CA6)),)),
      backgroundColor: Colors.white,
      ),
      body: BlocProvider<LoginBloc>(
        bloc: _loginBloc,
          child: LoginForm(userRepository: _userRepository)
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
