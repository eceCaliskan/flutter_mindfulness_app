import 'dart:math';
import 'package:flutter/material.dart';

//
// This class creates the home page
//

class AddFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Feel',
          style: TextStyle(
            color: Color(0xFF8CADCA),
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.white,
        //leading: Icon(Icons.menu, color: Colors.green)
        iconTheme: IconThemeData(color: Color(0xFF4F747D)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(children: [

            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text(
                    "Enter your friend email address"
                    "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
