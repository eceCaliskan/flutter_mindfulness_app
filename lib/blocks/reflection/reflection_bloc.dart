import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/blocks/reflection/reflection_event.dart';
import 'package:flutter_app/blocks/reflection/relection_state.dart';
import 'package:meta/meta.dart';
import 'package:flutter_app/userRepository/userRepository.dart';

///The Login bloc class returns the Reflection events to Reflection States
///with the help of flutter_bloc
///@Ece caliskan
///2021

class ReflectionBloc extends Bloc<ReflectionEvent, ReflectionState> {
  final UserRepository _userRepository;

  ReflectionBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  ReflectionState get initialState => Empty(); //no values on the database


  //convert events to state by calling the responsible methods
  @override
  Stream<ReflectionState> mapEventToState(
    currentState,
    ReflectionEvent event,
  ) async* {
    if (event is AddDatabase) {
      yield* _mapAddtextToDatabase(event.answer1, event.answer2, event.answer3,
          event.question1, event.question2, event.question3);
    } else if (event is ReturnDatabase) {
      yield* _mapRetrieveTextfromDatabase();
    }
  }

  //adding data(question and answers) to cloud firestore
  Stream<ReflectionState> _mapAddtextToDatabase(
    String answer1,
    String answer2,
    String answer3,
    String question1,
    String question2,
    String question3,
  ) async* {
    await _userRepository.addTextToDatabase(
        answer1, answer2, answer3, question1, question2, question3);
    yield Submitted(answer1, answer2, answer3, question1, question2, question3);
  }
  //returning data from firestore as a List
  Stream<ReflectionState> _mapRetrieveTextfromDatabase() async* {
    final texts = await _userRepository.getTexts();
    yield Retrieved(texts);
  }
}


