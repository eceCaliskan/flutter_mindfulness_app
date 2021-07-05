

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_app/ui/pages/homePage/bottomNavigationBar.dart';

import 'package:flutter_app/userRepository/userRepository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../1.dart';

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  final UserRepository user2 = UserRepository();


  testWidgets("bottom navigationbar", (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(

          //body: BlocProvider(
           // bloc: loginBloc,
            body: BottomNavigation(userRepository: user2, username: "ece",
              //adding the class bottomnavigation to the test
            ),
          ),
        ),
      //),
    );

    final findAppBar = find.byType(AppBar);
    final findTitle = find.text("Feel");
    final findItem1 = find.text("Home");
    final findIcon1 = find.byIcon(Icons.home);
    final findItem2 = find.text("Mindfulness");
    final findIcon2 = find.byIcon(Icons.article_rounded);
    final findItem3 = find.text("Meditation");
    final findIcon3 = find.byIcon(Icons.local_florist);
    final findItem4 = find.text("Journaling");
    final findIcon4 = find.byIcon(Icons.assignment_sharp);
    final bottombar = find.byKey(ValueKey("bottomnavigation"));
    final findItem5 = find.text("Nothing");
    await tester.pump();

    expect(findTitle, findsOneWidget);
    expect(findAppBar,findsOneWidget);
    expect(findItem1,findsOneWidget);
    expect(findIcon1,findsOneWidget);
    expect(findItem2,findsOneWidget);
    expect(findIcon2,findsOneWidget);
    expect(findItem3,findsOneWidget);
    expect(findIcon3,findsOneWidget);
    expect(findItem4,findsOneWidget);
    expect(findIcon4,findsOneWidget);
    expect(findItem5,findsNothing);
    expect(bottombar,findsOneWidget);
  });
}
