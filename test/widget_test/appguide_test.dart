import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/blocks/login/login_bloc.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/ui/pages/homePage/appGuide.dart';
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

  testWidgets("app guide", (WidgetTester tester) async {

    final appbar = find.byType(AppBar);
    final appbartitle = find.text("Feel");
    final column = find.byType(Column);
    final container = find.byType(Container);
    final text = find.text("This app created to help people to learn more about mindfulness. Home page contains quotes to motivate you"
        " Mindfulness section gives information about mindfulness and brings your attention to the moment."
        " The next section contains a un-guidedmeditation to help you observe your thoughts and feelings."
        " The final section helps you to reflect on yourself, emotions and thoughts"
        "\n \n Stay Mindful!!");
    final text2 = find.text("must not be found");


    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider(
            bloc: loginBloc,
            child: AppGuide(),
          ),
        ),
      ),
    );
    await tester.pump();

    expect(text, findsOneWidget);
    expect(text2, findsNothing);
    expect(appbar, findsOneWidget);
    expect(appbartitle, findsOneWidget);
    expect(column, findsOneWidget);
    expect(container, findsOneWidget);
  });
}
