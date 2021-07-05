import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/blocks/reflection/reflection_bloc.dart';
import 'package:flutter_app/blocks/reflection/reflection_event.dart';
import 'package:flutter_app/blocks/reflection/relection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//This class sets the answer of the previous questions to the screen
//ece caliskan
//2021


class SelfReflectionAnswer extends StatefulWidget {
  @override
  _SelfReflectionAnswer createState() => _SelfReflectionAnswer();
}

class _SelfReflectionAnswer extends State<SelfReflectionAnswer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ReflectionBloc _reflectionbloc = BlocProvider.of<ReflectionBloc>(context);

    return Container(
      color: Color(0xFF8CADCA),
      child: BlocBuilder(
          bloc: _reflectionbloc,
          builder: (BuildContext context, ReflectionState state) {
            BlocProvider.of<ReflectionBloc>(context).dispatch(ReturnDatabase());

            if (state is Retrieved && state.dataList.isNotEmpty) {
              String a = state.dataList.elementAt(0).toString();
              String b = a.replaceAll(new RegExp("{"), '');
              String c = b.replaceAll(new RegExp(":"), ',');
              final seperate = c.split(',');
              final Map<int, String> values = {
                for (int i = 0; i < seperate.length; i++) i: seperate[i]
              };

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        //implementing the text
                        height: MediaQuery.of(context).size.height / 10,
                        child: Text(
                          "This is your corner",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Flexible(
                      //first question and answer
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.height / 1,
                          height: MediaQuery.of(context).size.height / 8,
                          color: Colors.white,
                          child: Center(
                            child: Text(
                              values[1],
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      //second question and answer
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        child: Container(
                          width: MediaQuery.of(context).size.height / 1,
                          height: MediaQuery.of(context).size.height / 9,
                          color: Colors.white,
                          child: Center(
                            child:
                                Text(values[3], style: TextStyle(fontSize: 15)),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      //third question and answer
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.height / 1,
                          height: MediaQuery.of(context).size.height / 9,
                          color: Colors.white,
                          child: Container(
                            child: Center(
                              child: Text(values[5],
                                  style: TextStyle(fontSize: 15)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              );
            } else if ((state is Retrieved &&
                    state.dataList.elementAt(0) == null) ||
                state is Submitted) {
              return Container(
                child: Center(
                  child: Text(
                    "Please answer your self reflection questions",
                  ),
                ),
              );
            }
            return Container();
          }),
    ); //);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
