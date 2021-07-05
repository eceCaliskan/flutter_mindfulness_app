import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

///Returns the interaction of the user from the UI as events to the TimerBloc
///@Ece caliskan
///2021

@immutable
abstract class TimerEvent extends Equatable {
  TimerEvent([List props = const []]) : super(props);
}

//the timer starts
class Start extends TimerEvent {
  final int duration;

  Start({@required this.duration}) : super([duration]);

  @override
  String toString() => "Start { duration: $duration }";
}

//the timer pauses
class Pause extends TimerEvent {
  @override
  String toString() => "Pause";
}

//the timer resumes
class Resume extends TimerEvent {
  @override
  String toString() => "Resume";
}

//resetting the timer
class Reset extends TimerEvent {
  @override
  String toString() => "Reset";
}

//each second passed
class Second extends TimerEvent {
  final int duration;

  Second({@required this.duration}) : super([duration]);

  @override
  String toString() => "Tick { duration: $duration }";
}


