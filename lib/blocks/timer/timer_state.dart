import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

///Returns the state according to the TimernBloc call
///@Ece caliskan
///2021

@immutable
abstract class TimerState extends Equatable {
  final int duration;

  TimerState(this.duration, [List props = const []])
      : super([duration]..addAll(props));
}

//Indicates the timer is not working
class Ready extends TimerState {
  Ready(int duration) : super(duration);

  @override
  String toString() => 'Ready { duration: $duration }';
}

//indicates the timer is paused
class Paused extends TimerState {
  Paused(int duration) : super(duration);

  @override
  String toString() => 'Paused { duration: $duration }';
}

//indicates the timer is running
class Running extends TimerState {
  Running(int duration) : super(duration);

  @override
  String toString() => 'Running { duration: $duration }';
}

//indicates the timer is finished
class Finished extends TimerState {
  Finished() : super(0);

  @override
  String toString() => 'Finished';
}
