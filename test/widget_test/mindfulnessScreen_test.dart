import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
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

  final UserRepository user2 = UserRepository();
  //final loginBloc = LoginBloc(userRepository: user2);

  testWidgets("mindfulnessScreen", (WidgetTester tester) async {

    
    final container = find.byKey(ValueKey("Container"));
    final container1 = find.byKey(ValueKey("Container1"));
    final text = find.text("Swipe");
    final text2 = find.text("Swipe22"); //will expected to find nothing
    final container2 = find.byKey(ValueKey("Container2"));


    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("feel"),
          ),
          body: //BlocProvider(
            //bloc: loginBloc,
            //child:
            MindfulnessScreen(),
          ),
        ),
    //  ),
    );
    await tester.pump();
    expect(text2, findsNothing);
    expect(text, findsOneWidget);
    expect(container1, findsOneWidget);
    expect(container2 , findsOneWidget);
    expect(container, findsOneWidget);
  });
}
