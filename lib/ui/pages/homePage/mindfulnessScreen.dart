import 'package:flutter/material.dart';

import 'mindfulness.dart';

//This class sets the text to the screen and includes Mindfulness page
//ece caliskan
//2021

class MindfulnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    key:
    ValueKey("MindfulnessScreenWidget");
    return Stack(children: <Widget>[
      new Container(
        key: ValueKey("Container"),
        color: Color(0xFFF6F6F6),
        //color: Color( 0xFFCDE3F6),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SizedBox(
          width: 400,
          height: 300,
          child: Container(
            key: ValueKey("Container1"),
            child: Text(
              "Swipe", //text on the top of the screen
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      new Container(
        //setting the boundaries of the container
        key: ValueKey("Container2"),
        margin: const EdgeInsets.only(
            right: 20.0, left: 20.0, top: 50.0, bottom: 50.0),
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          // border: Border.all(color: Color()),
          borderRadius: BorderRadius.all(Radius.circular(60)), //round corners
          //color: Color(0xFFA3D0F7),
        ),
        child: MindfulnessPage(),
      )
    ]);
  }
}
