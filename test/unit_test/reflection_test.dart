

import 'package:flutter_app/blocks/reflection/reflection_bloc.dart';
import 'package:flutter_app/blocks/reflection/reflection_event.dart';
import 'package:flutter_app/blocks/reflection/relection_state.dart';

import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository{}

void main() {
  ReflectionBloc reflectionBloc;
  MockUserRepository _userRepository;

  setUp(() {
    _userRepository = MockUserRepository();
    reflectionBloc = ReflectionBloc(userRepository: _userRepository);
  });

  test('initial state is correct', () {
    expect( reflectionBloc.state, emits(Empty()) );

  });

  test(
      'emits [ready, running and pause] when the state is pause',
          () async {

        final list = [null, null, null, null, null, null];
        final expectedResponse = [

          Empty(),
          Retrieved(list),
        ];

        expectLater(
          reflectionBloc.state,
          emitsInOrder(expectedResponse),
        );
        await reflectionBloc.dispatch(AddDatabase(answer1: "1", answer2: "2", answer3: "3", question1:
        "q1", question2: "q2", question3: "q3"));
      }
  );

  test(
      'emits [ready, running and pause] when the state is pause',
          () async {

        final list = [null, null, null, null, null, null];

        final expectedResponse = [

          Submitted(null, null, null, null, null, null),
          Retrieved(list),


         // Retrieved(list),
        ];

        expectLater(
          reflectionBloc.state,
          emitsInOrder(expectedResponse),
        );
        await reflectionBloc.dispatch(ReturnDatabase());
      }
  );

}