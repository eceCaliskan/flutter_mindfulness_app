
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

///Returns the interaction of the user from the UI as events to the ReflectionBloc
///@Ece caliskan
///2021

@immutable
abstract class ReflectionEvent extends Equatable {
  ReflectionEvent([List props = const []]);
}

//Adding question and answers to the database
class AddDatabase extends ReflectionEvent {
  final String answer1;
  final String answer2;
  final String answer3;
  final String question1;
  final String question2;
  final String question3;

  AddDatabase({ @required this.answer1, @required this.answer2,
    this.answer3, this.question1, this.question2, this.question3 })
      :super([answer1, answer2, answer3]);
}

//Returning the answers and questions from database
  class ReturnDatabase extends ReflectionEvent {
    String toString() => 'retrieved';
}





