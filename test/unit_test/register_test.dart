
import 'package:flutter_app/blocks/login/login_state.dart';
import 'package:flutter_app/blocks/login/validator.dart';
import 'package:flutter_app/blocks/register/register_event.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/blocks/register/register_state.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository{}

void main() {
  RegisterBloc registerBloc;
  MockUserRepository _userRepository;

  setUp(() {
    _userRepository = MockUserRepository();
    registerBloc = RegisterBloc(userRepository: _userRepository);
  });

  test('initial state is correct', () {
    expect( registerBloc.state, emits(EmptyRegister()) );

  });

  group('email changed ', ()
  {
    test(
        'email changed with a valid email',
            () async {
          when(registerBloc.dispatch(EmailChanged(email: "ece98caliskan@gmail.com")));
          expect( RegExp(
            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
          ).hasMatch("ece98caliskan@gmail.com"), true);
          expect(registerBloc.state, emitsInOrder([EmptyRegister(), RegisterSuccessEmailPassword()]));
        }
    );
      test(
      'email changed with an invalid email',
          () async {
        when(registerBloc.dispatch(EmailChanged(email: "djasjh.ksdfjdsfjksd@ds")));
        expect( RegExp(
          r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
        ).hasMatch("djasjh.ksdfjdsfjksd"), false);
        expect(registerBloc.state, emitsInOrder([EmptyRegister(), RegisterEmailFailure()]));
      }
  );
  });

  group('password changed ', ()
      {
        test(
            'password changed with a valid password',
                () async {
              final password = "abcdefghi12345";
              when(registerBloc.dispatch(PasswordChanged(password: password)));
              expect( RegExp(
                r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
              ).hasMatch(password), true);
              expect(registerBloc.state, emitsInOrder([EmptyRegister(), RegisterSuccessEmailPassword()]));
            }
        );
        test(
            'password changed with an invalid password -- no number',
                () async {
              final password = "abcrfegegergefdefferf";
              when(registerBloc.dispatch(PasswordChanged(password: password)));
              expect( RegExp(
                r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
              ).hasMatch(password), false);
              expect(registerBloc.state, emitsInOrder([EmptyRegister(), RegisterPasswordFailure()]));


            }
        );

        test(
            'password changed with an invalid password -- no letter',
                () async {
              final password = "123454556456457675";
              when(registerBloc.dispatch(PasswordChanged(password: password)));
              expect( RegExp(
                r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
              ).hasMatch(password), false);
              expect(registerBloc.state, emitsInOrder([EmptyRegister(), RegisterPasswordFailure()]));
            }
        );
        test(
            'password changed with an invalid password -- less than 8 characters',
                () async {
              final password = "123asd";
              when(registerBloc.dispatch(PasswordChanged(password: password)));
              expect( RegExp(
                r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
              ).hasMatch(password), false);
             expect(registerBloc.state, emitsInOrder([EmptyRegister(), RegisterPasswordFailure()]));
            }
        );
      }
      );
}