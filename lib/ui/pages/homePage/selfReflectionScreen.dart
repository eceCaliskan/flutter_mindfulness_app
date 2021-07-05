import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/blocks/login/login_bloc.dart';
import 'package:flutter_app/blocks/reflection/reflection_bloc.dart';
import 'package:flutter_app/blocks/reflection/reflection_event.dart';
import 'package:flutter_app/ui/pages/homePage/selfReflectionQuestion.dart';
import 'package:flutter_app/userRepository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'selfReflectionAnswer.dart';

//Provides the structure of the login page and includes the login form
//ece caliskan
//2021


class SelfReflection extends StatefulWidget {
  final UserRepository _userRepository;

  SelfReflection({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<SelfReflection> createState() => _SelfReflection();
}

class _SelfReflection extends State<SelfReflection> {
  ReflectionBloc _reflectionBloc;

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    _reflectionBloc = ReflectionBloc(
      userRepository: _userRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReflectionBloc>(
      bloc: _reflectionBloc,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              backgroundColor: Colors.white,
              bottom: TabBar(
                key: ValueKey("history"),
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Self Reflection',
                  ),
                  Tab(

                    text: 'History',
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              SelfReflectionQuestion(),
              SelfReflectionAnswer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _reflectionBloc.dispose();
    super.dispose();
  }
}
