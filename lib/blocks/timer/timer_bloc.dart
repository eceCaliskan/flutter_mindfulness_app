
import 'package:flutter_app/blocks/timer/timer_data.dart';
import 'package:flutter_app/blocks/timer/timer_event.dart';
import 'package:flutter_app/blocks/timer/timer_state.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

///The Timer bloc class returns the Timer events to Timer States
///with the help of flutter_bloc
///@Ece caliskan
///2021

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Tick _tick;
  //AudioCache audioCache=  AudioCache();
  final int _duration = 600; //meditation duraion 10 min.

  //to listen the changes in the minutes
  StreamSubscription<int> _minuteListener;

  //adding the data to the bloc
  TimerBloc({@required Tick tick})
      : assert(tick != null),
        _tick = tick;

  //the timer not working
  @override
  TimerState get initialState => Ready(_duration);

  //Converts events to states and return states by calling methods
  @override
  Stream<TimerState> mapEventToState(
      currentState, TimerEvent event,
      ) async* {
    if (event is Start) {
      yield* _startToState(event);
    } else if (event is Pause) {
      yield* _pauseToState(event);
    } else if (event is Resume) {
     yield* _resumeToState(event);
    } else if (event is Reset) {
      yield* _resetToState(event);
    } else if (event is Second) {
      yield* _minuteToState(event);
   }
  }

  //starts the timer
  Stream<TimerState> _startToState(Start start1) async* {
    yield Running(start1.duration); //informs the running state
    _minuteListener?.cancel();      //disposes minute listener to start over
    //starts streamsubscription with the tick class
    _minuteListener = _tick.tick(ticks: start1.duration).listen(
          (duration) { dispatch(Second(duration: duration));
      },
    );
  }

  //pauses the timer
  Stream<TimerState> _pauseToState(Pause pause) async* {
      _minuteListener?.pause(); //pauses the listener
      yield Paused(currentState.duration); //returns paused state
  }

  //resumes the timer
  Stream<TimerState> _resumeToState(Resume resume) async* {
      _minuteListener?.resume(); //resumes listening to changes in the timer
      yield Running(currentState.duration);
  }

  //resets the timer
  Stream<TimerState> _resetToState(Reset reset) async* {
    _minuteListener?.cancel(); //disposes the timer
    yield Ready(_duration);
  }

  //rturns if the stateis running or finished
  Stream<TimerState> _minuteToState(Second tick) async* {
    //continues to return running state until the duration becomes 0
    yield tick.duration > 0 ? Running(tick.duration) : Finished();
  }

  @override
  void dispose() {
    _minuteListener?.cancel();
    super.dispose();
  }
}