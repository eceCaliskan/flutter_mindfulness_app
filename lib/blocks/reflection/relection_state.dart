import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

///Returns the state according to the ReflectionBloc call
///@Ece caliskan
///2021

@immutable
abstract class ReflectionState extends Equatable {
  ReflectionState([List props = const []]);
}
//The data submitted
class Submitted extends ReflectionState {
  String answer1, answer2, answer3, question1, question2, question3;

  Submitted(this.answer1, this.answer2, this.answer3, this.question1, this.question2,
      this.question3)
      : super([answer1, answer2, answer3, question1, question2, question3]);

}
//The data retrieved
class Retrieved extends ReflectionState {
  List dataList;

  Retrieved(this.dataList) : super([dataList]);

}
//Initial state of the reflection data
class Empty extends ReflectionState {
}
