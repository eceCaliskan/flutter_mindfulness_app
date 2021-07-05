import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocks/reflection/reflection_bloc.dart';
import 'package:flutter_app/blocks/reflection/reflection_event.dart';
import 'package:flutter_app/ui/pages/homePage/selfReflectionAnswer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//This class sets the questions to the screen
//ece caliskan
//2021


class SelfReflectionQuestion extends StatefulWidget {
  @override
  _SelfReflectionQuestion createState() => _SelfReflectionQuestion();
}

class _SelfReflectionQuestion extends State<SelfReflectionQuestion> {
  var questionList = [
    "Write the words you need to hear",
    "Make a list of everything that inspires you.",
    "What do you love about life?",
    "What do you need to forgive yourself for?",
    "What big changes do you want to make in your life?",
    "Do you take care of yourself today?",
    "What are you proud of?",
    "What do you want to let go of?",
    "What did you learn today?",
    "What are you experiencing emotionally right now in this very moment?",
    "What are you experiencing mentally right now in this very moment?",
    "What worries you most about the future?",
    "What matters most in your life?",
    "When did you last push the boundaries of your comfort zone?",
    "What do you most value in yourself?",
    "What do you want most in life?",
    "What is one thing you wish you did this year but didn’t because you were afraid?",
  ];

  //recieving the number numbers
  int _randomNumber = 0 + Random().nextInt(6 - 0);
  int _randomNumber2 = 6 + Random().nextInt(12 - 6);
  int _randomNumber3 = 12 + Random().nextInt(17 - 12);

  //recievethe user input
  final TextEditingController _textField1 = TextEditingController();
  final TextEditingController _textField2 = TextEditingController();
  final TextEditingController _textField3 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      key: ValueKey("question1"),
                      controller: _textField1,
                      maxLines: 10,
                      minLines: 2,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: questionList[_randomNumber],
                        filled: true,
                        fillColor: Color(0xFFCFEAFF),
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            color: Color(0xFFDBF0F6),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            color: Color(0xFFDBF0F6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    key: ValueKey("question2"),
                    controller: _textField2,
                    maxLines: 10,
                    minLines: 2,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: questionList[_randomNumber2],
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color(0xFFCFEAFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color(0xFFDBF0F6),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color(0xFFDBF0F6),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    key: ValueKey("question3"),
                    controller: _textField3,
                    maxLines: 10,
                    minLines: 2,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: questionList[_randomNumber3],
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color(0xFFCFEAFF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Color(0xFFDBF0F6),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xFFDBF0F6)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 80.0, right: 80.0, top: 10.0),
                  child: RaisedButton(
                    key: ValueKey("buttonsave"),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        BlocProvider.of<ReflectionBloc>(context)  //adding the questions and answers to the database
                            .dispatch(AddDatabase(
                          question1: questionList[_randomNumber],
                          question2: questionList[_randomNumber2],
                          question3: questionList[_randomNumber3],
                          answer1: _textField1.text,
                          answer2: _textField2.text,
                          answer3: _textField3.text,
                        ));

                        BlocProvider.of<ReflectionBloc>(context)
                            .dispatch(ReturnDatabase());





                        shape:
                        new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(21 / 1),
                          side: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        );
                        SelfReflectionAnswer();
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textField1.dispose();
    _textField2.dispose();
    _textField3.dispose();
    super.dispose();
  }
}
