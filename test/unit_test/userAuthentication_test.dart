
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/blocks/authentication/autentication_bloc.dart';
import 'package:flutter_app/blocks/authentication/autentication_event.dart';
import 'package:flutter_app/blocks/authentication/autentication_state.dart';
import 'package:flutter_app/blocks/login/login_bloc.dart';
import 'package:flutter_app/blocks/login/login_event.dart';
import 'package:flutter_app/blocks/login/login_state.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../1.dart';


class MockUser extends Mock implements User{}
final MockUser _mockUser = MockUser();

class MockFirebaseAuth extends Mock implements FirebaseAuth{
  @override
  Stream<User> authStateChanges() {
    return Stream.fromIterable([_mockUser]);
  }
}

Future<void> main() async {
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  AuthenticationBloc authenticationBloc;
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final UserRepository user = UserRepository(firebaseAuth: mockFirebaseAuth);
  authenticationBloc = AuthenticationBloc(userRepository: user);
  LoginBloc loginBloc = LoginBloc(userRepository: user);


// ALL MY TESTS WOULD BE HERE
  test("emit occurs", () async {
    expectLater(user.userTest, emitsInOrder([_mockUser]));
  });

  test("create an account", () async {

    when(await mockFirebaseAuth.createUserWithEmailAndPassword(
        email: "ece@gmail.com", password: "ece123456")
    ).thenAnswer((realInvocation) => null);
    expect(await user.signUpWithEmail(
        email: "ece@gmail.com", password: "ece123456"), "Success");

    loginBloc.dispatch(LoginWithCredentialsPressed(email: "ece@gmail.com", password: "ece123456"));

    //Authenticated(username: "ece");

  });

  test("sign in", () async {
    expect(authenticationBloc.initialState, Uninitialized());
    when(mockFirebaseAuth.signInWithEmailAndPassword(
        email: "ece@gmail.com", password: "ece123456"))
        .thenAnswer((realInvocation) => null);
    expect(await user.signInWithEmail(email: "ece@gmail.com", password: "ece123456"), "Success");
  });

  test("sign out", () async {
    when(mockFirebaseAuth.signOut())
        .thenAnswer((realInvocation) => null);
    expect(await user.signOut(), "Success");
    authenticationBloc.dispatch(LoggedOut());
  });


}