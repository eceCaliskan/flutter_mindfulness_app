import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/ui/pages/homePage/homePage.dart';
import 'package:flutter_app/ui/pages/homePage/mindfulnessScreen.dart';
import 'package:flutter_app/ui/pages/registerForm.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../1.dart';

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  testWidgets("home page", (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("feel"),
          ),
          body: //BlocProvider(
          //bloc: loginBloc,
          //child:
          HomePage(),
        ),
      ),
      //  ),
    );

    //search the elements
    final container = find.byType(Container);
    final text = find.byKey(ValueKey("text1"));
    //non-existed key value
    final nonExistedText = find.byKey(ValueKey("nothing"));
    await tester.pump();

    //return the elements with expected result
    expect(text, findsOneWidget);
    expect(container, findsOneWidget);
    //non-existed elements. The tester must return findNoting
    expect(nonExistedText, findsNothing);
  });
}
