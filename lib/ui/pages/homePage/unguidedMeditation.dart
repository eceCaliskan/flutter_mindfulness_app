import 'package:flutter/material.dart';
import 'package:flutter_app/blocks/timer/timer_bloc.dart';
import 'package:flutter_app/blocks/timer/timer_data.dart';
import 'package:flutter_app/blocks/timer/timer_event.dart';
import 'package:flutter_app/blocks/timer/timer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//This class builds the meditation timer and the circular progress bar
//ece caliskan
//2021

class UnguidedMeditation extends StatelessWidget {
  double result;

  @override
  Widget build(BuildContext context) {
    final TimerBloc _timerBloc = TimerBloc(tick: Tick());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            "Give yourself 10 minutes",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0, top: 40.0),
          child: BlocBuilder(
            bloc: _timerBloc,
            builder: (context, state) {
              final String minutesStr = ((state.duration / 60) % 60)
                  .floor()
                  .toString()
                  .padLeft(2, '0');
              final String secondsStr =
                  (state.duration % 60).floor().toString().padLeft(2, '0');
              return Stack(children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Text(
                      '$minutesStr:$secondsStr',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      backgroundColor:  Color(0xFF9FBDC4),
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      value: state.duration / 600,
                      strokeWidth: 20,
                    ),
                    height: 200.0,
                    width: 200.0,
                  ),
                )
              ]);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 10),
          child: BlocBuilder(
              bloc: _timerBloc,
              builder: (context, state) {
                final TimerState state = _timerBloc.currentState;
                if (state is Ready || state is Paused) {
                  return new IconButton(
                    key: ValueKey("playicon"),
                    icon: new Icon(Icons.play_arrow),
                    iconSize: 60,
                    onPressed: () => _timerBloc.dispatch(
                      Start(duration: state.duration),
                    ),
                  );
                } else if (state is Running) {
                  return new IconButton(
                    key: ValueKey("stopicon"),
                    icon: new Icon(Icons.pause),
                    iconSize: 60,
                    onPressed: () => _timerBloc.dispatch(Pause()),
                  );
                } else if (state is Finished) {
                  _timerBloc.dispatch(Reset());
                }
                return Container();
              }),
        ),
      ],
    );
  }
}
