import 'package:flutter_app/blocks/login/validator.dart';
import 'package:flutter_app/blocks/register/register_event.dart';
import 'package:flutter_app/blocks/register/register_bloc.dart';
import 'package:flutter_app/blocks/register/register_state.dart';
import 'package:flutter_app/blocks/timer/timer_bloc.dart';
import 'package:flutter_app/blocks/timer/timer_data.dart';
import 'package:flutter_app/blocks/timer/timer_event.dart';
import 'package:flutter_app/blocks/timer/timer_state.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


void main() {
  RegisterBloc registerBloc;
  Tick _ticker;
  TimerBloc _timerBloc;
  final int _duration = 600;

  setUp(() {
    _ticker = Tick();
    _timerBloc = TimerBloc(tick: _ticker);
  });

  test('initial state is correct', () {
    expect( _timerBloc.state, emits(Ready(_duration)) );
  });


    test(
        'emits [ready and running] when the state is start',
            () async {

          final expectedResponse = [
            Ready(_duration),
            Running(_duration),
          ];

          expectLater(
            _timerBloc.state,
            emitsInOrder(expectedResponse),
          );
         await _timerBloc.dispatch(Start(duration: _duration));
        }
    );

  test(
      'emits [ready, running and pause] when the state is pause',
          () async {

        final expectedResponse = [
          Ready(_duration),
          Paused(_duration),
        ];

        expectLater(
          _timerBloc.state,
          emitsInOrder(expectedResponse),
        );
        await _timerBloc.dispatch(Pause());
      }
  );

  test(
      'emits [ready, running and pause] when the state is pause',
          () async {

        final expectedResponse = [

          //Reset(),
          Ready(_duration)
        ];

        expectLater(
          _timerBloc.state,
          emitsInOrder(expectedResponse),
        );
        await _timerBloc.dispatch(Reset());
      }
  );
}