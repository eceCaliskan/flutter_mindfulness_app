

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/blocks/authentication/autentication_bloc.dart';
import 'package:flutter_app/blocks/authentication/autentication_event.dart';
import 'package:flutter_app/blocks/authentication/autentication_state.dart';
import 'package:flutter_app/blocks/login/login_bloc.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

class MockUserRepository extends Mock implements UserRepository{}
class MockFirebase extends Mock implements FirebaseAuth{}
class MockFirebaseUser extends Mock implements User{}
class MockFirebaseCloud extends Mock implements FirebaseFirestore{}



void main() {
  AuthenticationBloc authenticationBloc;
  MockUserRepository userRepository;

  setUp(() {
    userRepository = MockUserRepository();
    authenticationBloc = AuthenticationBloc(userRepository: userRepository);
  });

  tearDown(() {
    authenticationBloc?.dispose();
  });

  test('initial state is correct', () {
    expect(authenticationBloc.initialState, Uninitialized());
  });

  group('LoggedIn', ()
  {
    test(
        'emits [uninitialized, authenticated] when the user loggs in',
            () async {

              final expectedResponse = [
                Uninitialized(), //first state
                Authenticated("ece"),//second state
               ];

               expectLater(
                   authenticationBloc.state,
                   emitsInOrder(expectedResponse),
                 );
              authenticationBloc.dispatch(LoggedIn());//athentication bloc is
              //called with the event loggedIn
                   }
            );});



    group('LoggedOut', () {
      test(
          'emits [uninitialized, unauthenticated] when the user logs out',
              () {
            final expectedResponse = [
              Uninitialized(),//first state
              Unauthenticated(),//second state
            ];
            expectLater(
              authenticationBloc.state,
              emitsInOrder(expectedResponse),
            );
            authenticationBloc.dispatch(LoggedOut());
                //athentication bloc is
                //called with the event loggedOut
          });
    });
  }

