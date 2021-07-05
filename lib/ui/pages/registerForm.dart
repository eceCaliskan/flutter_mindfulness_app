import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/blocks/authentication/autentication_bloc.dart';
import 'package:flutter_app/blocks/authentication/autentication_event.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/blocks/register/register_state.dart';
import 'package:flutter_app/blocks/register/register_event.dart';
import 'package:flutter_app/ui/authorize.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//This class is used to create the register form
//ece caliskan
//2021


class RegisterForm extends StatefulWidget {
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();

    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _registerBloc,
      builder: (BuildContext context, RegisterState state) {  //when the user logges in, navigattes them to the home page
        if (state is RegisterSuccess) {
          print(_usernameController.text);
          BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedIn());//alerts the authentication bloc for the login event
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Authorize(
                  email: _usernameController.text,
                ),
              ),
            );
          });
        }

        return Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("5.JPG"), fit: BoxFit.cover),
          ),
          child: Form(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
                left: 20.0,
              ),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 5),
                  TextFormField(
                    //username field
                    key: Key("usernamefield"),
                    controller: _usernameController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.person_rounded,
                          color: Colors.white,
                        ),
                        labelText: 'Username',
                        hoverColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                  TextFormField(
                    //email field
                    key: Key("emailfield"),
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        labelText: 'Email',
                        hoverColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white)),
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) { //to see if the state of the email
                      //is valid or not
                      if (state is RegisterEmailFailure) {
                        return 'Invalid Email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(  //password field
                    key: Key("passwordfield"),
                    controller: _passwordController,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        labelText: 'Password',
                        hoverColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white)),
                    obscureText: true,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {//to see if the state of the password
                      //is valid or not
                      return state is RegisterPasswordFailure
                          ? 'Invalid Password'
                          : null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ButtonTheme(
                      minWidth: 150.0,
                      height: 50.0,
                      child: RaisedButton(  //button to register user
                          key: Key("registerbutton"),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          color: Colors.white,
                          onPressed: () { //calling the registerbloc
                            _registerBloc.dispatch(Submitted(
                                email: _emailController.text,
                                password: _passwordController.text,
                                username: _usernameController.text));
                          },
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(26 / 1.5),
                            side: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          )),
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _registerBloc.dispatch(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _registerBloc.dispatch(
      PasswordChanged(password: _passwordController.text),
    );
  }
}
