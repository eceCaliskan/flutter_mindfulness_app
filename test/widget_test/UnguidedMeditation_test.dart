import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/blocks/timer/timer_bloc.dart';
import 'package:flutter_app/blocks/timer/timer_data.dart';
import 'package:flutter_app/ui/pages/homePage/unguidedMeditation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import '../1.dart';

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  testWidgets("unguided meditation", (WidgetTester tester) async {

    final bloc = TimerBloc(tick: Tick());


    final column = find.byType(Column);
    final stack = find.byType(Stack);
    final padding = find.byType(Padding);
    final  circularProgressIndicator = find.byType( CircularProgressIndicator);
    final  iconButton = find.byType(IconButton);
    final  playIconButton = find.byIcon(Icons.play_arrow);
    final  noIconButton = find.byIcon(Icons.stop);


    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            bloc: bloc,
            child: UnguidedMeditation(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(stack, findsWidgets);
    expect(column, findsWidgets );
    expect(padding, findsWidgets );
    expect(circularProgressIndicator, findsWidgets );
    expect(iconButton, findsWidgets );
    expect(playIconButton, findsWidgets );
    //nothing found
    expect(noIconButton, findsNothing );

  });
}