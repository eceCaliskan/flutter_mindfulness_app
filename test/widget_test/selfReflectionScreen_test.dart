import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/blocks/reflection/reflection_bloc.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/ui/pages/homePage/homePage.dart';
import 'package:flutter_app/ui/pages/homePage/mindfulnessScreen.dart';
import 'package:flutter_app/ui/pages/homePage/selfReflectionAnswer.dart';
import 'package:flutter_app/ui/pages/homePage/selfReflectionScreen.dart';
import 'package:flutter_app/ui/pages/registerForm.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import '../1.dart';

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  testWidgets("self reflection screen", (WidgetTester tester) async {
    final UserRepository user2 = UserRepository();
    final reflectionBloc = ReflectionBloc(userRepository: user2);
    //final text2 = find.byKey(ValueKey("11"));

    final defaultTabController = find.byType(DefaultTabController);
    final tabBar = find.byType(TabBar);
    final tabs = find.byType(Tab);
    final tabBarView = find.byType(TabBarView);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(

          body: BlocProvider(
            bloc: reflectionBloc,
            child: SelfReflection(userRepository: user2,
            ),
          ),
        ),
      ),
    );
    // await tester.pump();
    await tester.pumpAndSettle();

    expect(defaultTabController, findsOneWidget);
    expect(tabBar, findsOneWidget);
    expect(tabs, findsWidgets);
    expect(tabBarView, findsOneWidget);
  });
}