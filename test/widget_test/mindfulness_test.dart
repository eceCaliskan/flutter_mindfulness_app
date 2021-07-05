import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/ui/pages/homePage/mindfulness.dart';
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

  //find the mindfulness widget
  testWidgets("mindfulness widget test", (WidgetTester tester) async {


    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MindfulnessPage())));


    final widget2 = find.byType(MindfulnessPage);//widget
    final page = find.byType(Page1);//find the first page
    await tester.pump();

    expect(widget2, findsOneWidget);//the widget found
    expect(page, findsOneWidget);//the first page found
  });

  //should  return the second widget
  testWidgets("page two test", (WidgetTester tester) async {

    await tester.pumpWidget(
        MaterialApp(
            home: Scaffold(
                body: PageView(
                  children: [
                    Page1(),
                    Page2(),
                    Page3(),
                    Page4(),
                    Page5(),
                    Page6(),
                  ],
                )
            )
        )
    );

    final text1 = find.byType(Page1);//second page
    final text2 = find.byType(Page2);//second page


    await tester.pump();
    expect(text1, findsOneWidget);
    expect(text2, findsOneWidget);
  });

  //expected to find page3 as the widget
  testWidgets("page3 test", (WidgetTester tester) async {

    await tester.pumpWidget(
        MaterialApp(
            home: Scaffold(
                body: PageView(
                  children: [
                    Page3(),
                    Page4(),
                    Page5(),
                    Page6(),
                  ],
                )
            )
        )
    );

    final text1 = find.byType(Page1);//find page1
    final text2 = find.byType(Page2);//find page2
    final text3 = find.byType(Page3);//find page3
    final text4 = find.byType(Page4);//find page4

    //finds page 3 and cannot find page 1, 2, 4
    await tester.pump();
    expect(text1, findsNothing);//nothing
    expect(text2, findsNothing);//nothing
    expect(text3, findsOneWidget);
    expect(text4, findsNothing);//nothing
  });

  testWidgets("page1 class test", (WidgetTester tester) async {

    await tester.pumpWidget(
        MaterialApp(
            home: Scaffold(
                body: Page1()
                )
            )
    );

    final container = find.byType(Container);
    final column = find.byType(Column);
    final text2 = find.text("Mindfulness is the ability to become fully present with our thoughts, feelings and daily experiences without any judgement but curiosity.",);
    final errortext = find.text("hello how are you");

    await tester.pump();
    expect(container, findsOneWidget);
    expect(column, findsOneWidget);
    expect(text2, findsOneWidget);
    expect(errortext, findsNothing);
  });

  testWidgets("page3 class test", (WidgetTester tester) async {

    await tester.pumpWidget(
        MaterialApp(
            home: Scaffold(
                body: Page3()
            )
        )
    );

    final container = find.byType(Container);
    final column = find.byType(Column);
    final text2 = find.text("Allow yourself to stay here and now, not in the anxiety of the future or regrets of the past. Cherish the moment and believe everything will work out as they supposed to, whether you worry or not.");
    final errortext = find.text("hello");

    await tester.pump();
    expect(container, findsOneWidget);
    expect(column, findsOneWidget);
    expect(text2, findsOneWidget);
    expect(errortext, findsNothing);
  });
}
