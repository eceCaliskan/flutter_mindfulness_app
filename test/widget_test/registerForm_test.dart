import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
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
  final registerBloc = RegisterBloc(userRepository: user2);


  testWidgets("register form", (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            bloc: registerBloc,
            child: RegisterForm(),
          ),
        ),
      ),
    );

    final addusernamefield = find.byKey(ValueKey("usernamefield"));
    final addemailfield = find.byKey(ValueKey("emailfield"));
    final addpasswordfield = find.byKey(ValueKey("passwordfield"));
    final addregisterbutton = find.byKey(ValueKey("registerbutton"));

    await tester.enterText(addusernamefield, "ece");
    await tester.enterText(addemailfield, "ece@gmail.com");
    await tester.enterText(addpasswordfield, "ece125");
    await tester.tap(addregisterbutton);
    await tester.pump();

    expect(find.text("ece"), findsOneWidget);
    expect(find.text("ece@gmail.com"), findsOneWidget);
    expect(find.text("ece125"), findsOneWidget);
    expect(find.text("ecfsfd@gmdfsfail.com"), findsNothing);//non-existed
    expect(find.text("ecesfdsfsdferf125"), findsNothing);//non-existed
    expect(find.byKey(ValueKey("registerbutton")),findsOneWidget);
  });
}


