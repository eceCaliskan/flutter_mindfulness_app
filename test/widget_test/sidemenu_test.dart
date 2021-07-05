import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/blocks/authentication/autentication_bloc.dart';
import 'package:flutter_app/blocks/reflection/reflection_bloc.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/ui/pages/homePage/homePage.dart';
import 'package:flutter_app/ui/pages/homePage/mindfulnessScreen.dart';
import 'package:flutter_app/ui/pages/homePage/selfReflectionAnswer.dart';
import 'package:flutter_app/ui/pages/homePage/selfReflectionScreen.dart';
import 'package:flutter_app/ui/pages/homePage/sideMenu.dart';
import 'package:flutter_app/ui/pages/registerForm.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../1.dart';

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  testWidgets("sidemenu", (WidgetTester tester) async {
    final UserRepository user2 = UserRepository();
    final authenticationBloc = AuthenticationBloc(userRepository: user2);
    //final text2 = find.byKey(ValueKey("11"));

    final listView = find.byType(ListView);
    final drawerHeader = find.byType(DrawerHeader);
    final text1 = find.text("Hello ece");
    final listTile = find.byType(ListTile);
    final text2 = find.text('App Guide');
    final text3 = find.text('Sign out');
    final text4 = find.text('non-existed');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(

          body: BlocProvider(
            bloc: authenticationBloc,
            child: SideMenu("ece"),
          ),
        ),
      ),
    );
    // await tester.pump();
    await tester.pumpAndSettle();

    expect(listView, findsOneWidget);
    expect(drawerHeader, findsOneWidget);
    expect(text1, findsWidgets);
    expect(listTile, findsWidgets);
    expect(text2, findsWidgets);
    expect(text3, findsWidgets);
    //returns findsNothing
    expect(text4, findsNothing);
  });
}