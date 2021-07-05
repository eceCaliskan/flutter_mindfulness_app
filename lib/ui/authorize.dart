import 'package:flutter/material.dart';
import 'package:flutter_app/blocks/authentication/autentication_bloc.dart';
import 'package:flutter_app/blocks/authentication/autentication_event.dart';
import 'package:flutter_app/blocks/authentication/autentication_state.dart';
import 'package:flutter_app/ui/pages/loginScreen.dart';
import 'package:flutter_app/ui/pages/homePage/bottomNavigationBar.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//This class is used to check whether the user is authorized or not and navigate them to the corresponding pages
//ece caliskan
//2021

class Authorize extends StatefulWidget {
  State<Authorize> createState() => _Authorize();
  final String email;
  Authorize ({Key key, @required this.email}) : super(key: key);
}

class _Authorize extends State<Authorize> {
  final UserRepository _userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: () async => false,
      child: BlocProvider(
        bloc: _authenticationBloc,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:
          BlocBuilder(
            bloc: _authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state is Unauthenticated || state is Uninitialized) { //if the user is unauthorized navigate to the login page
                return LoginScreen(userRepository: _userRepository);}
              else if (state is Authenticated) {
                return BottomNavigation(username: state.username, userRepository:_userRepository );} //if the user is authorized navigate to the home page
              return Container();},
          ),
      )
      ),
    );
  }}

