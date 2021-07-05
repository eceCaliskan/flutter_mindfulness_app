
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/blocks/reflection/reflection_bloc.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/ui/pages/homePage/homePage.dart';
import 'package:flutter_app/ui/pages/homePage/mindfulnessScreen.dart';
import 'package:flutter_app/ui/pages/homePage/selfReflectionAnswer.dart';
import 'package:flutter_app/ui/pages/registerForm.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../1.dart';

//Continue


Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  testWidgets("self reflection answer", (WidgetTester tester) async {
    final UserRepository user2 = UserRepository();
    final reflectionBloc = ReflectionBloc(userRepository: user2);

    final listValues = ["first question", "second question", "third question"];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(

          body: BlocProvider(
          bloc: reflectionBloc,
              child:  Container(
                        color: Colors.white,
                          child: Text(
                            listValues[0],
                          ),),)),),);

    //returns widget
    final container = find.byType(Container);
    final addZeroIndexText = find.text("first question");
    //returns nothing
    final addFirstIndexText = find.text("first question");
    final addSecondIndexText = find.text("first question");
    await tester.pumpAndSettle();

    //returns widget
    expect(container, findsWidgets);
    expect(addZeroIndexText, findsWidgets);
    //returns nothing
    expect(addFirstIndexText, findsNothing);
    expect(addSecondIndexText, findsNothing);

  });
}