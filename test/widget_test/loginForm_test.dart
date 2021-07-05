import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/blocks/login/login_bloc.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/ui/pages/loginForm.dart';
import 'package:flutter_app/ui/pages/registerForm.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../1.dart';

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  final UserRepository user2 = UserRepository();
  final loginBloc = LoginBloc(userRepository: user2);

  testWidgets("login form", (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            bloc: loginBloc,
            child: LoginForm(userRepository: user2,),
          ),
        ),
      ),
    );
//find widgets with the corresponding values
    final addusernamefield = find.byKey(ValueKey("emailfield1"));
    final addemailfield = find.byKey(ValueKey("passwordfield1"));
    final addloginbutton = find.byKey(ValueKey("submitloginbutton1"));

//insert values to the text form fields
    await tester.enterText(addusernamefield, "ece");
    await tester.enterText(addemailfield, "ece@gmail.com");
    await tester.tap(addloginbutton);
    await tester.pump();

//expect the inserted values to be returned
    expect(find.text("ece"), findsOneWidget);
    expect(find.text("mark"), findsNothing);
    expect(find.text("ece@gmail.com"), findsOneWidget);
    expect(find.text("mark@gmail.com"), findsNothing);
    expect(find.byKey(ValueKey("submitloginbutton")),findsNothing);
  });
}


