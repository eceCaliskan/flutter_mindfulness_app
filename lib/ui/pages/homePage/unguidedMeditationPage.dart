import 'package:flutter/material.dart';
import 'package:flutter_app/ui/pages/homePage/homePage.dart';
import 'package:flutter_app/ui/pages/homePage/unguidedMeditation.dart';

//This class divides screen into two represents image on the right side
//ece caliskan
//2021

class MeditationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Row(children: <Widget>[
        Expanded(
          flex: 5,
          child: UnguidedMeditation(),
        ),
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                  decoration: BoxDecoration(//setting the image
                   color: Color(0xFFCCCCFF),
                   image: DecorationImage(
                   image: AssetImage("5.JPG"), fit: BoxFit.fitHeight),
                  ),
              ),
            )),
      ]
    );
  }
}
