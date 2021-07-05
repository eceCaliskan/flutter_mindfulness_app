import 'package:flutter_app/blocks/login/login_bloc.dart';
import 'package:flutter_app/blocks/login/login_event.dart';
import 'package:flutter_app/blocks/login/login_state.dart';
import 'package:flutter_app/blocks/login/validator.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository{}

void main() {
  LoginBloc loginBloc;
  MockUserRepository _userRepository;

  setUp(() {
    _userRepository = MockUserRepository();
    loginBloc = LoginBloc(userRepository: _userRepository);
  });

  test('initial state is correct', () {
    expect(loginBloc.state, emits(LoginInitial()));

  });
  group('email changed ', ()
  {
    test(
        'email changed with a valid email',
            () async {
          when(loginBloc.dispatch(EmailChanged(email: "ece98caliskan@gmail.com")));
          expect( RegExp(
            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
          ).hasMatch("ece98caliskan@gmail.com"), true);
          expect(loginBloc.state, emitsInOrder([LoginInitial(), SuccessEmailPassword()]));
        }
    );
    test(
        'email changed with an invalid email',
            () async {
          when(loginBloc.dispatch(EmailChanged(email: "djasjh.ksdfjdsfjksdds")));
          expect( RegExp(
            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
          ).hasMatch("djasjh.ksdfjdsfjksd"), false);
          expect(loginBloc.state, emitsInOrder([LoginInitial(), EmailFailure()]));
        }
    );
  });

  group('password changed ', ()
  {
    test(
        'password changed with a valid password',
            () async {
          final password = "abcdefghi12345";
          when(loginBloc.dispatch(PasswordChanged(password: password)));
          expect( RegExp(
            r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
          ).hasMatch(password), true);
          expect(loginBloc.state, emitsInOrder([LoginInitial(), SuccessEmailPassword()]));
        }
    );
    test(
        'password changed with an invalid password -- no number',
            () async {
          final password = "abcrfegegergefdefferf";
          when(loginBloc.dispatch(PasswordChanged(password: password)));
          expect( RegExp(
            r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
          ).hasMatch(password), false);
          expect(loginBloc.state, emitsInOrder([LoginInitial(), PasswordFailure()]));
        }
    );

    test(
        'password changed with an invalid password -- no letter',
            () async {
          final password = "123454556456457675";
          when(loginBloc.dispatch(PasswordChanged(password: password)));
          expect( RegExp(
            r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
          ).hasMatch(password), false);
          expect(loginBloc.state, emitsInOrder([LoginInitial(), PasswordFailure()]));
        }
    );
    test(
        'password changed with an invalid password -- less than 8 characters',
            () async {
          final password = "123asd";
          when(loginBloc.dispatch(PasswordChanged(password: password)));
          expect( RegExp(
            r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
          ).hasMatch(password), false);
          expect(loginBloc.state, emitsInOrder([LoginInitial(), PasswordFailure()]));
        }
    );
  }
  );
}