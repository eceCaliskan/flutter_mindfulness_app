import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app/blocks/authentication/autentication_bloc.dart';
import 'package:flutter_app/blocks/authentication/autentication_event.dart';
import 'package:flutter_app/blocks/login/login_bloc.dart';
import 'package:flutter_app/blocks/login/login_event.dart';
import 'package:flutter_app/blocks/login/login_state.dart';
import 'package:flutter_app/ui/authorize.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'registerScreen.dart';

//This class is used to create the login form
//ece caliskan
//2021

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  LoginForm({Key key, @required UserRepository userRepository, name})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController(); //recieves user input
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;
  UserRepository get _userRepository => widget._userRepository;
  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;


  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        if (state is LoginSuccess) {  //navigates to the homepage if the user logged in
          BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedIn());
          SchedulerBinding.instance.addPostFrameCallback((_) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    Authorize(email: _emailController.text),
              ),
            );
          });
        }
        return Container(
          decoration: BoxDecoration( //setting the background image
            image:
                DecorationImage(image: AssetImage("5.JPG"), fit: BoxFit.cover),
          ),
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: <Widget>[
                  Padding(//setting the logo of the application
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 40,
                        left: MediaQuery.of(context).size.width / 40
                    ),
                    child: Image.asset('1.JPG',
                        height: MediaQuery.of(context).size.height / 4
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),

                  TextFormField(   //setting the email textformfield
                    key: ValueKey("emailfield1"),
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        labelText: 'Email',
                        hoverColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.black54)
                    ),
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {//checking the email with the validator
                       if(state is EmailFailure) {
                         return 'Invalid Email' ;
                       }
                       return null;
                    },
                  ),
                  TextFormField(//setting the password textformfield
                    key: ValueKey("passwordfield1"),
                    controller: _passwordController,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        labelText: 'Password',
                        hoverColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.black54)
                    ),
                    obscureText: true,
                    autovalidate: true,
                    autocorrect: false,
                    validator: (_) {//checking the password with the validator
                      return state is PasswordFailure? 'Invalid Password' : null;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 80),
                  RaisedButton( //setting the button for submit
                      key: ValueKey("submitloginbutton1"),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Color(0xFF969CA6),
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        _loginBloc.dispatch(LoginWithCredentialsPressed(
                            email: _emailController.text,
                            password: _passwordController.text
                        )
                        );
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(21 / 1),
                        side: BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                  ),
                  ButtonTheme( //setting the clickable text to navigate user to the signup page
                    minWidth: 10.0,
                    height: 10.0,
                    child: GestureDetector(
                      key: ValueKey("gestureDetector"),
                      child: Center(
                        child: Text(
                          "Create an account",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      onTap: () { // navigation to the registerscreen to show registerform
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RegisterScreen(
                              userRepository: _userRepository);
                        }));
                      },
                    ),
                  ),
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
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.dispatch(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.dispatch(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.dispatch(
      LoginWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
