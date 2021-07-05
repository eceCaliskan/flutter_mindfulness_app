import 'package:flutter/material.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'registerForm.dart';

//This class is used to create the appbar element and set the bloc Provider for the RegisterForm class
//ece caliskan
//2021

class RegisterScreen extends StatefulWidget {
  final UserRepository _userRepository;

  RegisterScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc(
      userRepository: widget._userRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //creating appbar
        title: Center(
            child: Text(
          'Sign up',
          style: TextStyle(fontSize: 25, color: Color(0xFF4F747D)),
        )),
        iconTheme: IconThemeData(color: Color(0xFF4F747D)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 100,
        child: Center(
          child: BlocProvider<RegisterBloc>(
            bloc: _registerBloc,
            child: RegisterForm(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _registerBloc.dispose();
    super.dispose();
  }
}
